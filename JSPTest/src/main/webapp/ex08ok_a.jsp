<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	//1. 데이터 가져오기
	//2. 업무 처리
	//3. 결과 출력
	
	//1.
	request.setCharacterEncoding("UTF-8");

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String text = request.getParameter("text");
	String backgroundcolor = request.getParameter("backgroundcolor");
	String color = request.getParameter("color");
	String fontsize = request.getParameter("fontsize");
	int count = Integer.parseInt(request.getParameter("count"));
	String leftright = request.getParameter("leftright");
	String topbottom = request.getParameter("topbottom");
	String icon = request.getParameter("icon");
	String isborder = request.getParameter("isborder");
	String borderwidth = request.getParameter("borderwidth");
	String bordercolor = request.getParameter("bordercolor");
	String borderstyle = request.getParameter("borderstyle");
	String borderradius = request.getParameter("borderradius");

%>        
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<script src="https://kit.fontawesome.com/7121714adf.js"></script>
	<style>
		.button {
			padding-left: 0px;
		}
		.button::before {
			content: none;
		}
		
		.button {
		 
			width: <%= width %>px;
			height: <%= height %>px;
			background-color: <%= backgroundcolor %>;
			color: <%= color %>;
			font-size: <%= fontsize %>px;
			margin: <%= topbottom %>px <%= leftright %>px;
			
			<% if (isborder.equals("n")) { %>
				border: 0;
			<% } else { %>
				border: <%= borderwidth %>px <%= bordercolor %> <%= borderstyle %>;
				border-radius: <%= borderradius %>px;
			<% } %>
			
		}
	</style>
</head>
<body>
	<!-- ex08ok.jsp -->
	<h1>결과</h1>
		
	<table class="vertical">
		<tr>
			<th>버튼</th>
		</tr>
		<tr>
			<td>
				<%-- 
				<button class="button" style="width:<%= width %>px;height:<%= height %>px;">Button</button> 
				--%>
				<%-- 
				<button class="button"><%= text %></button> 
				--%>
				<!-- 
				<button class="button">
					<span class="glyphicon glyphicon-heart"></span>
					Button
				</button> 
				-->
				<% for (int i=0; i<count; i++) { %>
					<button class="button">
						<% if (!icon.equals("none")) { %>
							<span class="<%= icon %>"></span>
						<% } %>
						<%= text %>
					</button>
				<% } %>
			</td>
		</tr>
	</table>
	
	<div>
		<input type="button" value="돌아가기" onclick="location.href='ex12_form.jsp';">
	</div>
	
	<hr>
	
	
	<div>
	<h5>결과 페이지에 아래 CSS 적용할 것</h5>
	<textarea class="full">.button {
	padding-left: 0px;
}
.button::before {
	content: none;
}</textarea></div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>






