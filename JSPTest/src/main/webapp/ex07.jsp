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
	<!-- ex07.jsp -->
	<h1>박스 만들기</h1>
	
	<form method="POST" action="ex07ok.jsp">
	<table class="vertical">
		<tr>
			<th>너비(px)</th>
			<td><input type="number" min="100" max="500" step="10" name="width" value="100"></td>
		</tr>
		<tr>
			<th>높이(px)</th>
			<td><input type="number" min="100" max="500" step="10" name="height" value="100"></td>
		</tr>
		<tr>
			<th>색상(px)</th>
			<td><input type="color" name="color" value="#FFFFFF"></td>
		</tr>
		<tr>
			<th>텍스트</th>
			<td><input type="text" name="txt" value="상자"></td>
		</tr>
		<tr>
			<th>개수</th>
			<td><input type="number" name="count" min="1" max="10" value="1"></td>
		</tr>
	</table>
	<div>
		<button>만들기</button>
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>