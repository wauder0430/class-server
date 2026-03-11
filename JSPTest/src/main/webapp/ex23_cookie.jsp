<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
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
    <!-- ex23_cookie.jsp -->
    <h1>쿠키 <small>JavaScript</small></h1>

    <div>
        <input type="button" value="쿠키에 데이터를 저장하기" id="btn1">
        <input type="button" value="쿠키의 데이터 읽기" id="btn2">
    </div>

    <script src="https://code.jquery.com/jquery-4.0.0.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script src="js/cookie.js"></script>
    <script>
        $('#btn1').click(() => {

            // 쿠키 쓰기
            // document.cookie = '홍길동';
            // document.cookie = 'name=홍길동,kor=100,eng=90,math=80';
            setCookie('name', '홍길동');
            setCookie('kor', 100);
            setCookie('eng', 90);
            setCookie('math', 80);

        });

        $('#btn2').click(() => {

            // alert(document.cookie);
            console.log(getCookie('name'));
            console.log(getCookie('kor'));
            console.log(getCookie('eng'));
            console.log(getCookie('math'));

        });
    </script>
</body>
</html>
