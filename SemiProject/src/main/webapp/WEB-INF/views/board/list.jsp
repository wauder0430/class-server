<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Semi Project</title>
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
		
	</style>
</head>
<body>
	<!-- list.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<div id="main">
		<h1>
			게시판 
			<c:if test="${map.search == 'n'}">
			<small>목록보기</small>
			</c:if>
			<c:if test="${map.search == 'y'}">
			<small>검색보기</small>
			</c:if>
		</h1>

		<c:if test="${map.search == 'y'}">
		<div id="labelSearch">
			'${map.word}'(으)로 검색한 결과 총 ${list.size()}개의 게시물이 있습니다.
		</div>
		</c:if>
		
		<%-- <div id="pagebar">
			<span>페이지: </span>
			<input type="number" class="short" id="page" value="${map.nowPage}" onkeydown="movePage();" min="1" max="${map.totalPage}">
			<input type="button" value="이동하기" id="btnPage" onclick="location.href='/semi/board/list.do?page=' + $('#page').val();">
		</div> --%>
		
		<%-- <div id="pagebar">
			<select onchange="location.href='/semi/board/list.do?page=' + $(this).val();">
				<c:forEach var="i" begin="1" end="${map.totalPage}">
					<c:if test="${map.nowPage == i}">
						<option value="${i}" selected>${i} 페이지</option>
					</c:if>
					<c:if test="${map.nowPage != i}">
						<option value="${i}">${i} 페이지</option>
					</c:if>
				</c:forEach>
			</select>
		</div> --%>
		
		<table id="list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>읽음</th>
			</tr>		
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>
				
				<!-- view.do?seq=10&search=n&column=&word=
				view.do?seq=10&search=y&column=content&word=자바 -->
				
					<a href="/semi/board/view.do?seq=${dto.seq}&search=${map.search}&column=${map.column}&word=${map.word}">${dto.subject}</a>

					<!-- 댓글 표시 -->
					<c:if test="${dto.commentCount > 0}">
						<span class="commentCount">(${dto.commentCount})</span>
					</c:if>
					
					<!-- 최신글 표시 -->
					<c:if test="${dto.isnew < 1 }">
						<span class="isnew">new</span>
					</c:if>
				</td>
				<td>${dto.name}</td>
				<td>${dto.regdate}</td>
				<td>${dto.readcount}</td> 
			</tr>
			</c:forEach> 
		</table>
		
		<!-- 
			가이드 라인
			1. <form method="POST"> : 기본
			2. <form method="GET">  : 가끔(검색)
		 -->
		<!-- 검색 -->
		<form method="GET" action="/semi/board/list.do" id="searchForm">
			<select name="column">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="name">이름</option>
				<option value="all">제목+내용</option>
			</select>
			<input type="text" name="word" class="long" required>
			<input type="submit" value="검색하기">
		</form>
		
		<!-- 페이지바 -->
		<div id="pagebar">${pagebar}</div>
		
		<div>
			<c:if test="${not empty auth}">
			<button type="button" class="add primary" onclick="location.href='/semi/board/add.do';">쓰기</button>
			</c:if>
		</div>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		<c:if test="${map.search == 'y'}">
		$('select[name=column]').val('${map.column}');
		$('input[name=word]').val('${map.word}');
		</c:if>
	
		function movePage() {
			if(event.keyCode == 13){
				$('#btnPage').click();
			}
		}
	</script>
</body>
</html>