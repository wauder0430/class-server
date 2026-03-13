<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Todo</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<link rel="stylesheet" href="/todo/css/main.css" />
</head>
<body class="narrow">
	<!-- main.jsp -->
	<h1 class="main">Todo List</h1>
	
	<table id="tbl1">
		<c:forEach items="${list}" var="dto">
		<c:if test="${dto.state == 'n' }">
		<tr>
			<td><input type="checkbox" data-seq="${dto.seq}"></td>
			<td>${dto.todo} <span>${dto.regdate}</span></td>
		</tr>
		</c:if>
		<c:if test="${dto.state == 'y' }">
		<tr style="background-color: #EFEFEF;">
			<td><input type="checkbox" checked data-seq="${dto.seq}"></td>
			<td class="checked">${dto.todo} <span>${dto.regdate}</span></td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	
	<hr>
	
	<form method="post" action="/todo/addok.do">
	<table id="tbl2">
		<tr>
			<td><input type="text" name="todo" required class="long"></td>
			<td><input type="submit" value="등록하기"></td>
		</tr>
	</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		// 완료/미완료 체크
		$('#tbl1 input[type=checkbox]').change(() =>{
			
			// alert($(event.target).prop('checked'));
			//alert($(event.target).data('seq'));
			
			let seq = $(event.target).data('seq');
			let state = $(event.target).prop('checked') ? 'y' : 'n';

			// JSP 페이지에서 자바스크립트 템플릿 문자열을 사용할 때 \${}
			location.href = `/todo/checkok.do?seq=\${seq}&state=\${state}`;
			
		});
		
		// 완료/미완료 체크
		$('#tbl1 tr td:nth-child(2)').click(() => {

			
			if(!event.ctrlKey){
				// $(event.target).prev().children().eq(0).click();
				$(event.currentTarget).prev().children().eq(0).click();
			} else {
				// 삭제
				// alert();
				// - delok.do?seq=1
				location.href = '/todo/delok.do?seq=' + $(event.currentTarget).prev().children().eq(0).data('seq');
			}
		});
	
	</script>
</body>
</html>