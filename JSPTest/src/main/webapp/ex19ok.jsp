<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    // 업로드한 파일 저장
    String path = application.getRealPath("/files");
    int size = 1024 * 1024 * 100;

    try {

        // multi 객체 생성 == 파일 업로드 완료
        MultipartRequest multi = new MultipartRequest(
                request,    // 원래 request
                path,        // 어디다가 저장할지? 경로
                size,        // 최대 크기
                "UTF-8",    // 인코딩
                new DefaultFileRenamePolicy() // 중복된 파일 이름 변경
        );

    } catch (Exception e) {
        e.printStackTrace();
    }

    // 업로드가 완료된 후 다시 목록으로 돌아가기
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
