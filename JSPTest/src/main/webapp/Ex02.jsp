<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Random rnd = new Random();
		int dan = rnd.nextInt(8) + 2; //2~9
	%>
	<h1>구구단 <%= dan %>단</h1>
	<%
		// 스파게티 코드
		for(int i=1; i<=9; i++){
	%>
	<div><%= dan %> X <%= i %> = <%= dan*i %></div>
	<%		
		}
	%>
	
	
</body>
</html>