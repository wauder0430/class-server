<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.memo.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. 데이터 가져오기(pw, memo, seq)
	// 1.5 암호 확인하기
	// 2. DB 작업 > 메모 수정하기(update)
	// 3. 마무리

	// 1.
	// POST + 한글 > UTF-8
	request.setCharacterEncoding("UTF-8");

	String pw = request.getParameter("pw");
	String memo = request.getParameter("memo");
	String seq = request.getParameter("seq");

	// 2.
	DBUtil util = new DBUtil();
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	// jsp안에서는 따로 try catch 필요 없음

	conn = util.open();

	// 암호 확인하기
	String sql = "select count(*) as cnt from tblMemo where seq = ? and pw = ?";
	stat = conn.prepareStatement(sql);

	stat.setString(1, seq);
	stat.setString(2, pw);

	rs = stat.executeQuery();

	int count = 0;

	if(rs.next()){
		count = rs.getInt("cnt");
	}

	rs.close();
	stat.close(); // prepareStatement는 닫음

	// 수정

	if(count == 1){
		sql = "update tblMemo set memo = ? where seq = ?";

		stat = conn.prepareStatement(sql);

		stat.setString(1, memo);
		stat.setString(2, seq);

		int result = stat.executeUpdate();



		if(result == 1){
			response.sendRedirect("/memo/list.jsp");
		} else {
			out.println("<script>alert('failed');history.back();</script>");
			out.close();
		}

	} else {
		out.println("<script>alert('wrong password');history.back();</script>");
		out.close();
	}

	stat.close();
	conn.close();

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
	<!-- editok.jsp -->
	<%@ include file="/inc/header.jsp"%>

	<h2>메모 <small>수정하기</small></h2>

	<script>

	</script>
</body>
</html>
