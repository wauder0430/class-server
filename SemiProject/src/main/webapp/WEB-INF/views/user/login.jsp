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
	<!-- login.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<div id="main">
		<h1>회원 <small>로그인</small></h1>
		
		<form method="post" action="/semi/user/login.do">
		<table class="vertical content">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" id="id" required class="short"></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" id="pw" required class="short"></td>
			</tr>
		</table>
		<div>
			<button type="button" class="back" onclick="location.href='/semi/index.do';">돌아가기</button>
			<button type="submit" class="login primary">로그인</button>
		</div>
		</form>
		
	</div>
	
	<hr>
	

	<form method="post" action="/semi/user/login.do">
		<input type="text" name="id" value="hong" hidden>
		<input type="text" name="pw" value="1111" hidden>
		<input type="submit" value=" 홍길동(hong) ">
	</form>

	<form method="post" action="/semi/user/login.do">
		<input type="text" name="id" value="dog" hidden>
		<input type="text" name="pw" value="1111" hidden>
		<input type="submit" value=" 강아지(dog) ">
	</form>

	<form method="post" action="/semi/user/login.do">
		<input type="text" name="id" value="cat" hidden>
		<input type="text" name="pw" value="1111" hidden>
		<input type="submit" value=" 고양이(cat) ">
	</form>


	<form method="post" action="/semi/user/login.do">
		<input type="text" name="id" value="tiger" hidden>
		<input type="text" name="pw" value="1111" hidden>
		<input type="submit" value=" 호랑이(tiger) ">
	</form>

	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>