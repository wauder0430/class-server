<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 자바 영역
	int a = 10;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* CSS 영역 */
	p { color: blue; font-size: <%= a %>rem; }
</style>
</head>
<body>
	<h1>Hello</h1>
	<p>안녕하세요. 홍길동입니다. </p>
	<p>a: <%= a %></p>
	<script>
		/* 자바스크립트 영역 */
	</script>
</body>
</html>