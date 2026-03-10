<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK"/>
    <style>

    </style>
</head>
<body>
	<!--  -->
	<h1>세션값 저장하기</h1>
	
	<%
		session.setAttribute("data", "홍길동");
	%>
	
	<div><a href="ex15_session.jsp">돌아가기</div>

	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>

	</script>
</body>
</html>