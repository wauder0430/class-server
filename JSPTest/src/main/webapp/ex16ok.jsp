<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	// <form method="POST" action="ex16ok.jsp" enctype="multipart/form-data">
	// - request의 일부 기능이 동작 안함
	// - request.getParameter()
	// - request.getParameterValues()

	// cos.jar > request를 대신하는 MultipartRequest 클래스 사용
	// 1. 기존의 request가 하던 getParameter() 사용
	// 2. 파일 업로드 처리 구현

	// 1. 업로드할 파일을 어디다 저장?
	// 2. 데이터 가져오기

	// String txt = request.getParameter("txt");

	// 업로드 위치 경로
	String path = application.getRealPath("/files");
	System.out.println(path);


	// 업로드 파일의 최대 크기
	// - byte
	int size = 1024 * 1024 * 100; // 100MB

	String txt = null;
	String filename = null;
	String orgfilename = null;

	try {

		// multi 객체 생성 == 파일 업로드 완료
		MultipartRequest multi = new MultipartRequest(
				request, 	// 원래 request
				path,		// 어디다가 저장할지? 경로
				size, 		// 최대 크기
				"UTF-8",	// 인코딩
				new DefaultFileRenamePolicy() // 중복된 파일 이름 변경
		);

		// 일반 문자열 가져오기
		txt = multi.getParameter("txt");

		// 업로드 파일명?
		// - <input type="file" name="attach">
		filename = multi.getFilesystemName("attach");
		orgfilename = multi.getOriginalFileName("attach");

	} catch (Exception e) {
		e.printStackTrace();
	}

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
<!-- ex16ok.jsp -->
<h1>결과</h1>

<div>txt: <%= txt %></div>
<div>filename: <%= filename %></div>
<div>originalfilename: <%= orgfilename %></div>

<h1>파일 다운로드</h1>
<!--
    장점: 간단함
    단점: 브라우저가 해석 가능한 파일은 바로 열어서 보여준다.
          파일명이 다를 수 있음
 -->
<%-- <div><a href="/jsp/files/<%= filename %>"><%= orgfilename %></a></div> --%>


<!--
    장점: 간단함
    단점: 파일명이 다를 수 있음 (뒤에 숫자)
 -->
<%-- <div><a href="/jsp/files/<%= filename %>" download><%= orgfilename %></a></div> --%>

<!--
    다운로드를 직접 구현
    장점: 완성도 높음
    단점: 코드 구현
 -->



<div><a href="download.jsp?filename=<%= filename %>&orgfilename=<%= orgfilename %>"><%= orgfilename %></a></div>

<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
<script src="https://bit.ly/4cMuheh"></script>
<script>

</script>
</body>
</html>