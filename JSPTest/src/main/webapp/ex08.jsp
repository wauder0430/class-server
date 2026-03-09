<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<script src="https://kit.fontawesome.com/45b31704a3.js" crossorigin="anonymous"></script>
	<style>
		
	</style>
</head>
<body>
	<!-- ex08.jsp -->
	<h1>버튼 만들기</h1>

	<form method="POST" action="ex08.jsp">
	<table class="vertical">
		<tr>
			<th>너비(px)</th>
			<td><input type="number" min="20" max="300" step="10" value="120"></td>
		</tr>
		<tr>
			<th>높이(px)</th>
			<td><input type="number" min="10" max="200" step="10" value="30"></td>
		</tr>
		<tr>
			<th>텍스트</th>
			<td><input type="text" value="Button"> </td>
		</tr>
		<tr>
			<th>배경색</th>
			<td><input type="color" value="#FFFFFF"></td>
		</tr>
		<tr>
			<th>글자색</th>
			<td><input type="color"></td>
		</tr>
		<tr>
			<th>글자 크기(px)</th>
			<td><input type="number" value="16" min="10" max="100"></td>
		</tr>
		<tr>
			<th>버튼 개수(ea)</th>
			<td><input type="number" value="1" min="1" max="30"></td>
		</tr>
		<tr>
			<th>버튼 간격</th>
			<td>
				<div>좌우 간격: <input type="range"></div><br>
				<div>상하 간격: <input type="range"></div>
			</td>
		</tr>
		<tr>
			<th>아이콘</th>
			<td><label><input type="radio" >없음</label><label><input type="radio" ><i class="fa-solid fa-house"></i></label><label><input type="radio" ><i class="fa-regular fa-image"></i></label><label><input type="radio" ><i class="fa-solid fa-location-dot"></i></label><label><input type="radio" ><i class="fa-brands fa-github"></i></label><label><input type="radio" ><i class="fa-solid fa-paperclip"></i></label></td>
		</tr>
		<tr>
			<th>테두리</th>
			<td>
				<select name="sel" >
					<option value="1">감추기</option>
					<option value="2">보이기</option>
				</select>
				<div name="sub">
					<div>두께(px): <input type="number"></div> 
				</div>
			</td>
		</tr>
	</table>
	</form>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>