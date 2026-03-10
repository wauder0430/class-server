<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Comparator" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%
	// 디렉토리 탐색
	String path = application.getRealPath("/pic");

	File dir = new File(path);
	File[] list = dir.listFiles();

	System.out.println(Arrays.toString(list));

	// list.sort();

	Arrays.sort(list, new Comparator<File>() {
		@Override
		public int compare(File o1, File o2) {
			return Long.compare(o2.lastModified(), o1.lastModified());
		}
	});

%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK" />
	<style>
		#list {
			width: 750px;
			display:flex;
			flex-wrap: wrap;
			margin-left: 25px;
		}
		
		#list .item {
			border: 1px solid #999999;
			width: 126px; height: 126px;
			margin: 11px;
			/* background-size: contain; */
			background-size: cover;
			background-repeat: no-repeat;
			background-position: center center;
			position: relative;
			left: 0px;
			top: 0px;
		}

		#list .item span {
			position: absolute;
			right: 5px;
			top: 0px;
			color: #FFFFFF;
			text-shadow: 0px 0px 2px black;
			cursor: pointer;
			display: none;
		}
		#list .item:hover span {
			display: inline;
		}

		#img1 {
			max-width: 490px;
			display: block;
			margin: 15px auto;
		}

	</style>
</head>
<body>
	<!-- ex18.jsp -->
	<%--
		1. HTML
		2. CSS
		3. JavaScript

		서버 작업
		1. JSP

		작업 순서
		HTML > CSS > JavaScript > JSP

		- HTML > CSS > JavaScript
		- JSP

	--%>

	<h1>Image Gallery</h1>

	<div id="list">
		<% for(File file : list) { %>
			<div class="item" style="background-image:url(pic/<%= file.getName() %>)" data-modal-button="view">
				<span title="delete" onclick="del();" data-filename="<%= file.getName() %>">&times;</span>
			</div>
		<% } %>
	</div>

	<hr>

	<form method="post" action="ex18ok.jsp" enctype="multipart/form-data">
	<table class="vertical">
		<tr>
			<th>이미지</th>
			<td><input type="file" name="attach" required accept="image/*"></td>
		</tr>
	</table>
	<div>
		<input type="submit" value=" 업로드 ">
	</div>
	</form>

	<div data-modal-window="view" data-modal-title="Image">
		<img id="img1">
		<hr>
		<div>
			<button class="ok" data-modal-ok="view">확인</button>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>

		$('#list .item').click(() =>{
			let filename = $(event.target).children('span').data('filename');
			$('#img1').attr('src', 'pic/' + filename);
		});

		function del(){
			if(confirm('delete?')){
				location.href = 'ex18del.jsp?filename=' + event.target.dataset['filename'];
			}

			// 이벤트 전파 방지
			event.stopPropagation();
			return false;
		}
	</script>
</body>
</html>