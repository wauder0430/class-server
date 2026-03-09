<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// A 페이지 > 이동 + 데이터 전달 > B 페이지
	// 1. <form>
	// 2. QueryString
	// 3. Server 기술로 페이지간 데이터를 전달
	// - pageContext.forward("URL")
	// - 페이지 이동 + request 데이터 전달(********)

	// ex11_pagecontext_one.jsp
	
	// 데이터 전달 유무
	// - response.sendRedirect("URL")
	// - pageContext.forward("URL")
	
	
	//지역 변수
	int a = 10;
	int b = 20;
	
	pageContext.setAttribute("a", a); 
	request.setAttribute("b", b);
	
	
	// 돌려줄 HTML 페이지에 location.href = 'ex11_pagecontext_two.jsp'; 코드 추가
	// 클라이언트 이동
	//response.sendRedirect("ex11_pagecontext_two.jsp");
	
	// 서브측 이동
	pageContext.forward("ex11_pagecontext_two.jsp");
	// pageContext는 죽고 request는 계속 유지

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
	<!-- ex11_pagecontext_one.jsp -->
	<h1>첫번째 페이지</h1>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>