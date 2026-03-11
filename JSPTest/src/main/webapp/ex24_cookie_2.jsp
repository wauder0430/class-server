<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String cbRemember = request.getParameter("cbRemember");

    // 로그인 처리
    if((id.equals("hong")) && (pw.equals("1234"))
        || (id.equals("test")) && (pw.equals("1234"))){

        // 로그인 성공
        // 인증 티켓(세션 or 쿠키)
        session.setAttribute("id", "id");

        // 아이디 기억하기 O,X
        if(cbRemember != null && cbRemember.equals("y")){
            // 아이디 기억하기
            // - 쿠키에 아이디 저장하기
            // - Servlet/JSP에서 쿠키를 조작하기
            Cookie cookie = new Cookie("id", id); // 쿠키 생성(setCookie 역할)

            // 만료 시간 지정
            cookie.setMaxAge(365*24*60*60);

            response.addCookie(cookie);

        } else {

            // 아이디(쿠키) 삭제하기
            Cookie[] cookies = request.getCookies();
            for(int i=0; i<cookies.length; i++){
                if(cookies[i].getName().equals("id")){
                    cookies[i].setMaxAge(0);
                    response.addCookie(cookies[i]); // 브라우저에 적용
                    break;
                }
            }

        }

    } else {

        // 로그인 실패

    }

    response.sendRedirect("ex24_cookie.jsp");

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
    <!-- ex24_cookie_2.jsp -->

    <script src="https://code.jquery.com/jquery-4.0.0.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>

    </script>
</body>
</html>
