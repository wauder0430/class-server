<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*  
		1페이지 > (이동) > 2페이지
		
		1.HTML
		- <a href="URL">
		- 사용자가 클릭
		
		2. JavaScript
		- location.href = 'URL';
		- location.assign('URL');
		- 자유롭게 원하는 상항에 호출 > 제어 가능
		- 클라이언트측 구현 
		
		3. Servlet/JSP
		- reponse.sendRedirect("URL");
		- 자유롭게 원하는 상황에 호출 > 제어 가능
		- 서버측 구현
	*/
	
	response.sendRedirect("ex10_response_two.jsp");
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<style>
		
	</style>
</head>
<body>
	<!-- ex10_response_one.jsp -->
	<h1>첫번째 페이지</h1>
	
	<div><a href="ex10_response_two.jsp">두번째 페이지</div>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		// location.href = 'ex10_response_two.jsp';
	</script>
</body>
</html>