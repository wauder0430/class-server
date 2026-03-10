<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    // 어떤 이미지를 삭제?

    // 1. 파일명 가져오기
    // 2. 이미지 파일 삭제하기
    // 3. 목록으로 돌아가기

    // 1. 파일명 가져오기
    String filename = request.getParameter("filename");

    String path = application.getRealPath("/files");

    File file = new File(path +"/" + filename);

    // 2. 이미지 파일 삭제하기
    file.delete();

    // 3. 목록으로 돌아가기
    response.sendRedirect("ex19.jsp");


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="http://bit.ly/3WJ5ilK"/>
    <style>

    </style>
</head>
<body>
<!--  -->

<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
<script src="https://bit.ly/4cMuheh"></script>
<script>

</script>
</body>
</html>
