<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = application.getRealPath("/files");
	System.out.println(path);
	
	int size = 1024 * 1024 * 100;
	
	String txt = null;
	ArrayList<String> filename = new ArrayList<String>();
	ArrayList<String> orgfilename = new ArrayList<String>();
	
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
		// - <input type="file" name="attach1">
		// - <input type="file" name="attach2">
		// - <input type="file" name="attach3">..
		Enumeration e = multi.getFileNames();
		
		while(e.hasMoreElements()){
			
			String file = (String)e.nextElement();
			System.out.println(file);
			
			filename.add(multi.getFilesystemName(file));
			orgfilename.add(multi.getOriginalFileName(file));
			
		}
		

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
	<!-- ex17ok.jsp -->
	<h1>결과</h1>
	
	<div>txt: <%= txt %></div>
	
	<div>
		<div>첨부파일: <%= filename.size() %>개</div>
		<% for(int i=0; i<filename.size(); i++) { %>
		<div>
			<a href="download.jsp?filename=<%= filename.get(i) %>&orgfilename=<%= orgfilename.get(i) %>"><%= orgfilename.get(i) %></a>
		</div>
		<% } %>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>