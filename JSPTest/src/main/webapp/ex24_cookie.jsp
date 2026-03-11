<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- ex24_cookie.jsp -->
    <h1>로그인</h1>

    <!--
        1. 아이디 기억하기(아이디 > 쿠키 저장)
        2. 자동 로그인하기(아이디, 암호 > 쿠키 저장)
    -->
    <form method="POST" action="ex24_cookie_2.jsp">
        <table class="vertical content">
            <tr>
                <th>아이디</th>
                <td><input type="text" name="id" required class="short"></td>
            </tr>
            <tr>
                <th>암호</th>
                <td><input type="password" name="pw" required class="short"></td>
            </tr>
        </table>
        <div>
            <div style="margin-bottom: 15px;"><label><input type="checkbox" name="cbRemember" id="cbRemember" value="y"> 아이디 기억하기</label></div>
            <div><input type="submit" value="로그인"></div>
        </div>
    </form>

    <hr>

    <c:if test="${not empty id}">
        <div>로그인 됨</div>
    </c:if>
    <c:if test="${empty id}">
        <div>로그인 안됨</div>
    </c:if>

    <script src="https://code.jquery.com/jquery-4.0.0.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script src="js/cookie.js"></script>
    <script>


        if (getCookie('id') == '') {
            //아이디 기억하기X
            $('input[name=id]').focus();

        } else {
            //아이디 기억하기O
            $('input[name=id]').val(getCookie('id'));
            $('input[name=pw]').focus();
            $('#cbRemember').prop('checked', true);
        }

    </script>
</body>
</html>

