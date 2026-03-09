<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<script src="https://kit.fontawesome.com/7121714adf.js"></script>
	<style>
		#borderbox {
			display: none;
		}
		#borderbox > div {
			margin-bottom: 5px;
		}
		input[type=color] {
			height: 35px;
		}
	</style>
</head>
<body>
	<!-- ex08.jsp -->
	<h1>버튼 만들기</h1>
		
	<form method="POST" action="ex08ok.jsp">
		<table id="tbl" class="vertical">
			<tr>
				<th>너비(px)</th>
				<td>
					<input type="number" name="width" min="20" max="300" step="10" value="120" class="short">
				</td>
			</tr>
			<tr>
				<th>높이(px)</th>
				<td>
					<input type="number" name="height" min="10" max="200" step="10" value="30" class="short">
				</td>
			</tr>
			<tr>
				<th>텍스트</th>
				<td>
					<input type="text" name="text" class="short" value="Button">
				</td>
			</tr>
			<tr>
			<th>배경색</th>
			<td><input type="color" name="backgroundcolor" value="#FFFFFF"></td>
		</tr>
		<tr>
			<th>글자색</th>
			<td><input type="color" name="color" value="#000000"></td>
		</tr>
		<tr>
			<th>글자 크기(px)</th>
			<td><input type="number" name="fontsize" min="10" max="100" value="16"></td>
		</tr>
		<tr>
			<th>버튼 개수(ea)</th>
			<td><input type="number" name="count" min="1" max="30" value="1"></td>
		</tr>
		<tr>
			<th>버튼 간격</th>
			<td>
				<div>좌우 간격 : <input type="range" min="0" max="50" value="0" name="leftright"></div>
				<div>상하 간격 : <input type="range" min="0" max="50" value="0" name="topbottom"></div>
			</td>
		</tr>
		<tr>
			<th>아이콘</th>
			<td>
				<input type="radio" name="icon" value="none" checked> 없음
				<input type="radio" name="icon" value="fa-solid fa-house"> <i class="fa-solid fa-house"></i>&nbsp;&nbsp;
				<input type="radio" name="icon" value="fa-solid fa-image"> <i class="fa-solid fa-image"></i>&nbsp;&nbsp;
				<input type="radio" name="icon" value="fa-solid fa-location-dot"> <i class="fa-solid fa-location-dot"></i>&nbsp;&nbsp;
				<input type="radio" name="icon" value="fa-brands fa-github"> <i class="fa-brands fa-github"></i>&nbsp;&nbsp;
				<input type="radio" name="icon" value="fa-solid fa-paperclip"> <i class="fa-solid fa-paperclip"></i>
			</td>
		</tr>
		<tr>
			<th>테두리</th>
			<td>
				<div style="margin-bottom: 10px;">
					<select name="isborder" id="isborder" class="form-control sm">
						<option value="n">감추기</option>
						<option value="y">보이기</option>
					</select>
				</div>
				<div id="borderbox">
					<div>두께(px) : <input type="number" name="borderwidth" min="0" max="10" value="1" class="form-control sm inline right"></div>
					<div>색상 : <input type="color" name="bordercolor" value="#000000" class="form-control sm"></div>
					<div>
						스타일 :
						<select name="borderstyle" class="form-control sm inline">
							<option value="solid">실선</option>
							<option value="dashed">쇄선</option>
							<option value="dotted">점선</option>
						</select>	
					</div>
					<div>
						모서리(px) : <input type="number" name="borderradius" min="0" max="50" value="0" class="form-control sm inline right">
					</div>
				</div>
			</td>
		</tr>
		</table>
		<div>
			<input type="submit" value="만들기"
				class="btn btn-success">
		</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		$("#isborder").change(function() {
			if ($(this).val() == "y") {
				$("#borderbox").show();
			} else {
				$("#borderbox").hide();
			}
		});
	</script>
</body>
</html>






