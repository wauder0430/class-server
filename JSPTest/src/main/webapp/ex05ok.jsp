<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    /*
        클라이언트 > (데이터 전송) > 서버

        1. POST
            - 패킷 본문에 넣어서 전송(표준)
            - 데이터가 드러나지 않는다.
            - 데이터 길이 제한 없음

        2. GET
            - URL 뒤에 붙여서 전송
            - URL 뒤에 데이터가 드러난다.
            - 256자 이내 > 주로 짧은 데이터만 전송

    */

    // 데이터 수신하기
    // - GET/POST와 무관하게 동작
    // - String request.getParmeter(String key)
    // - key: 태그의 name

    // <input type="text" name="txt"

    String txt = request.getParameter("txt");
    String num = request.getParameter("num");
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
<!-- ex05ok.jsp -->
<h1>결과</h1>

<div>txt: <%= txt %>
</div>
<div>num: <%= num %>
</div>

<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
<script src="https://bit.ly/4cMuheh"></script>
<script>

</script>
</body>
</html>