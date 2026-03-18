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
	<!-- view.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<div id="main">
		<h1>게시판 <small>보기</small></h1>
		
		<table class="vertical">
			<tr>
				<th>번호</th>
				<td>${dto.seq}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name}(${dto.id})</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><c:out value="${dto.subject}" /></td>
			</tr>
			<tr style="height: 250px;">
				<th>내용</th>
				<td>${dto.content}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${dto.regdate}</td>
			</tr>
			<tr>
				<th>읽음</th>
				<td>${dto.readcount}</td>
			</tr>
		</table>
		
		<!-- 댓글보기(수정하기,삭제하기) -->
		
		<table id="comment">
			<c:forEach items="${clist}" var="cdto">
			<tr>
				<td class="commentContent">
					<div>${cdto.content}</div>
					<div>${cdto.regdate}</div>
				</td>
				<td class="commentInfo">
					<div>
						<div>${cdto.name}(${cdto.id})</div>
						<c:if test="${not empty auth and (auth == cdto.id || authDto.lv == '2')}"> 
							<div>
								<span onclick="delComment(${cdto.seq});">🗑️</span>
								<span onclick="editComment(${cdto.seq});">⌨️</span>
							</div>
						</c:if>
					</div>
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<!-- 댓글쓰기 -->
		<form method="POST" action="/semi/board/addcomment.do">
		<table id="addComment">
			<tr>
				<td><input type="text" name="content" class="full" required></td>
				<td><button type="submit" class="comment">댓글 쓰기</button></td>
			</tr>
		</table>
		<input type="hidden" name="bseq" value="${dto.seq}">
		</form>
		
		<div>
		
			<button type="button" class="back"
				onclick="location.href='/semi/board/list.do?search=${map.search}&column=${map.column}&word=${map.word}';">돌아가기</button>
			
			<!-- 
			<button type="button" class="back"
				onclick="history.back();">돌아가기</button> 
			-->
						
			<c:if test="${not empty auth and (auth == dto.id || authDto.lv == '2')}">
			<button type="button" class="edit primary"
				onclick="location.href='/semi/board/edit.do?seq=${dto.seq}';">수정하기</button>
			<button type="button" class="del primary"
				onclick="location.href='/semi/board/del.do?seq=${dto.seq}';">삭제하기</button>
			</c:if>
				
				
		</div>
		
	</div>
	
	<form id="editForm" method="post" action="/semi/board/editcomment.do">
		<input type="hidden" name="seq">
		<input type="hidden" name="content">
		<input type="hidden" name="bseq">
	</form>
	
	<script>
		
		function delComment(seq) {
			
			// delcomment.do?seq=10&bseq=10
			//alert(seq);
			
			if(confirm('delete?')){
				location.href = '/semi/board/delcomment.do?seq=' + seq + '&bseq=${dto.seq}';
			}
			
		}
	
		function editComment(seq) {

			$('.commentEditRow').remove();
			
			// 수정할 댓글 원본 내용 가져오기
			let content = $(event.target).parents('tr').children().eq(0).children().eq(0).text();
			
			// alert(content)
			
			let editRow = `
				<tr class="commentEditRow">
					<td><input type="text" class="full" name="content" required value="\${content}"></td>
					<td class="commentEdit">
						<button type="button" onclick="$(event.target).parents('tr').remove();">취소</button>
						<button type="button" onclick="editOkComment(\${seq});">수정하기</button>
					</td>
				</tr>
			`;
			
			$(event.target).parents('tr').after(editRow);
					
			
		}
		
		function editOkComment(seq){
			const content = $('input[type=text][name=content]').val(); // 수정할 댓글
			const bseq = ${dto.seq};
			
			//alert(seq);
			//alert(content);
			$('input[type=hidden][name=seq]').val(seq);
			$('input[type=hidden][name=bseq]').val(bseq);
			$('input[type=hidden][name=content]').val(content);
			
			// 에뮬레이터 함수
			$('#editForm').submit();
			
		}
		
	</script>
</body>
</html>






