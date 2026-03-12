<%@ page import="com.test.memo.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. DB 작업 > 목록 가져오기(select)
	// 2. 결과셋 > 화면에 출력

	DBUtil util = new DBUtil();
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;

	String sql = "select * from tblMemo ORDER BY regdate DESC";

	conn = util.open();
	stat = conn.createStatement();
	rs = stat.executeQuery(sql);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Memo</title>
	<%@ include file="/inc/asset.jsp"%>
	<style>

	</style>
</head>
<body>
	<!-- list.jsp -->
	<%@ include file="/inc/header.jsp"%>

	<h2>메모 <small>목록보기</small></h2>

	<div id="list">
		<%
			while (rs.next()) {

				String memo = rs.getString("memo");
				memo = memo.replace("\r\n", "<br>");
		%>
		<div class="item">
			<div><%= memo %></div>
			<div>
				<span><%= rs.getString("name") %></span>
				/
				<span><%= rs.getString("regdate") %></span>
			</div>
			<div>
				<button type="button" class="edit" onclick="location.href='/memo/edit.jsp?seq=<%= rs.getString("seq") %>';">수정하기</button>
				<button type="button" class="del" onclick="location.href='/memo/del.jsp?seq=<%= rs.getString("seq") %>';">삭제하기</button>
			</div>
		</div>
		<% } %>
	</div>

	<div>
		<button type="button" class="add" onclick="location.href='/memo/add.jsp';">쓰기</button>
	</div>


	<script>

	</script>
</body>
</html>
