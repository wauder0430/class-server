<%@ page import="com.test.memo.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// edit.jsp?seq=24

	// 1. 데이터 가져오기(seq)
	// 2. DB 작업 > select
	// 3. 결과값 > 컨트롤의 기본값 출력

	// 1.
	String seq = request.getParameter("seq");

	// 2.
	DBUtil util = new DBUtil();
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	String sql = "select * from tblMemo where seq = ?";

	conn = util.open();
	stat = conn.prepareStatement(sql);
	stat.setString(1, seq);

	rs = stat.executeQuery();

	String name = "";
	String memo = "";

	if(rs.next()) {
		name = rs.getString("name");
		memo = rs.getString("memo");
	}

	rs.close();
	stat.close();
	conn.close();

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
	<!-- edit.jsp -->
	<%@ include file="/inc/header.jsp" %>

	<h2>메모 <small>수정하기</small></h2>

	<!--
		*** <input> 태그의 name과 DB의 컬럼명을 동일하게 작성하는 습관
	-->
	<form method="POST" action="/memo/editok.jsp">
		<table class="vertical">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name" required value="<%= name %>" readonly></td>
			</tr>
			<tr>
				<th>암호</th>
				<td><input type="password" name="pw" required></td>
			</tr>
			<tr>
				<th>메모</th>
				<td><textarea name="memo" required class="full"><%= memo %></textarea></td>
			</tr>
		</table>
		<div>
			<button type="submit" class="edit">수정하기</button>
			<button type="button" class="back" onclick="location.href='/memo/list.jsp';">돌아가기</button>
		</div>
		<%-- *** hidden 태그로 작성한 값 > 반드시 소스보기 확인 --%>
		<input type="hidden" name="seq" value="<%= seq %>">
	</form>


	<script>

	</script>
</body>
</html>






