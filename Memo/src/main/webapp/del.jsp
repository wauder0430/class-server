<%@ page import="com.test.memo.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// del.jsp?seq=25

	// 1. 데이터 가져오기(seq)

	// 1.
	String seq = request.getParameter("seq");


%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Memo</title>
	<%@ include file="/inc/asset.jsp" %>
	<style>

	</style>
</head>
<body>
	<!-- del.jsp -->
	<%@ include file="/inc/header.jsp" %>

	<h2>메모 <small>삭제하기</small></h2>

	<!--
		*** <input> 태그의 name과 DB의 컬럼명을 동일하게 작성하는 습관
	-->
	<form method="POST" action="/memo/delok.jsp">
		<table class="vertical">
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" required autofocus></td>
			</tr>
		</table>
		<div>
			<button type="submit" class="edit">삭제하기</button>
			<button type="button" class="back" onclick="location.href='/memo/list.jsp';">돌아가기</button>
		</div>
		<%-- *** hidden 태그로 작성한 값 > 반드시 소스보기 확인 --%>
		<input type="hidden" name="seq" value="<%= seq %>">
	</form>


	<script>

	</script>
</body>
</html>






