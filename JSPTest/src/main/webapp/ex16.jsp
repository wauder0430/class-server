<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!--  -->
	<h1>파일 업로드 <small>단일 파일</small></h1>
	
	
	<!--  
		파일 업로드 설정
		
		1. 서버측
			- 파일 업로드 라이브러리 사용
			- cos.jar 적용
				a. build path > jar 추가
				b. WEB-INF > lib > jar 추가
				
		2. 클라이언트측
			a. <input type="file"> 사용
			b. <form method="POST"> 사용
			c. <form enctype="">
				1. application/x-www-form-urlencoded(기본값)
					- 전송할 값들을 문자열로 전송합니다.
				2. multipart/form-data
					- 문자열 + 비문자열 동시 전송합니다.
	-->
	
	<form method="POST" action="ex16ok.jsp" enctype="multipart/form-data">
	<table class="vertical">
		<tr>
			<th>문자열</th>
			<td><input type="text" name="txt" value="홍길동"></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file" name="attach"></td>
		</tr>
	</table>
	<div>
		<button>보내기</button>
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>