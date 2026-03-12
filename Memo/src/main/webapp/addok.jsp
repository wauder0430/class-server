<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.memo.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. 데이터 가져오기(name, pw, memo)
	// 2. DB 작업 > 메모 쓰기(insert)
	// 3. 마무리
	
	// 1.
	// POST + 한글 > UTF-8
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String memo = request.getParameter("memo");


	// 2.
	DBUtil util = new DBUtil();
	Connection conn = null;
	PreparedStatement stat = null;
	
	// jsp안에서는 따로 try catch 필요 없음
	
	conn = util.open();
	
	String sql = "INSERT INTO tblMemo (seq, name, pw, memo, regdate) VALUES (seqMemo.nextval, ?, ?, ?, default)";
	
	stat = conn.prepareStatement(sql);
	stat.setString(1, name);
	stat.setString(2, pw);
	stat.setString(3, memo);
			
	int result = stat.executeUpdate();
	
	stat.close();
	conn.close();

	if(result == 1){
		response.sendRedirect("/memo/list.jsp");
	} else {
		out.println("<script>alert('failed');history.back();</script>");
		out.close();
	}
	
			
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
    <!-- addok.jsp -->
    <%@ include file="/inc/header.jsp"%>
	
	<h2>메모 <small>쓰기</small></h2>
	
	<%--
	<% if(result == 1){ %>
	<div class="message">메모 작성을 완료했습니다.</div>
	<div><button type="button" class="back" onclick="location.href='/memo/list.jsp';">돌아가기</button></div>
	<% } %>
	<% if(result == 0){ %>
	<div class="message">메모 작성을 실패했습니다.</div>
	<!-- <div><button type="button" class="back" onclick="location.href='/memo/add.jsp';">돌아가기</button></div> -->
	<div><button type="button" class="back" onclick="history.back();">돌아가기</button></div>
	<%  } %>
	 --%>

    <script>
    
    	<%--<% if(result == 1){ %>
			alert('메모 작성을 완료했습니다.');
			location.href = '/memo/list.jsp';
		<% } %>
		
		<% if(result == 0){ %>
			alert('메모 작성을 실패했습니다.');
			history.back();
		<%  } %>--%>
    
    </script>
</body>
</html>
