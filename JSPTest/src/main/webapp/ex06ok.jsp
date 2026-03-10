<%@page import="java.util.Arrays" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    // 데이터 수신하기
    // request.getParameter() 동작 String
    // request.getParameterValues() String[]
    // 1. 컨트롤 입력 O > 입력값 반환
    // 2. 컨트롤 입력 X > "" 반환
    // 3. 키가 오타 > null 반환

    // 텍스트 박스
    String txt1 = request.getParameter("txt1");

    // 암호 박스
    String txt2 = request.getParameter("txt2");

    // 텍스트 박스(다중라인)
    String txt3 = request.getParameter("txt3");

    // 개행 문자 처리
    // - \r\n > <br>
    txt3 = txt3.replace("\r\n", "<br>");

    // 체크 박스
    // 1. value 작성 O
    // 	- 체크 O > value 반환
    // 	- 체크 X > null 반환
    // 2. value 작성 X
    // 	- 체크 O > "on" 반환
    // 	- 체크 X > null 반환
    String cb1 = request.getParameter("cb1");

    // 체크박스들
    String cb2 = request.getParameter("cb2");
    String cb3 = request.getParameter("cb3");
    String cb4 = request.getParameter("cb4");

    String temp = "";
    temp += cb2 + ", ";
    temp += cb3 + ", ";
    temp += cb4 + ", ";

    // 체크박스들
    String cb5[] = request.getParameterValues("cb5");
    System.out.println(cb5);

    // 라디오 버튼
    String rb1 = request.getParameter("rb1");

    // 셀렉트 박스
    String sel1 = request.getParameter("sel1");

    // 셀렉트 박스
    String[] sel2 = request.getParameterValues("sel2");

    // 히든태그
    String id = request.getParameter("id");

    // 날짜
    String regdate = request.getParameter("regdate");

    // 색상
    String color = request.getParameter("color");

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
<!-- ex06ok.jsp -->
<h1>결과</h1>

<h2>텍스트 박스</h2>
<div><%= txt1 %>
</div>

<h2>암호 박스</h2>
<div><%= txt2 %>
</div>

<h2>텍스트 박스(다중라인)</h2>
<div><%= txt3 %>
</div>

<h2>체크 박스</h2>
<div><%= cb1 %>
</div>

<h2>체크 박스들</h2>
<div><%= temp %>
</div>

<h2>체크 박스들</h2>
<div><%= Arrays.toString(cb5) %>
</div>

<h2>라디오 버튼</h2>
<div><%= rb1 %>
</div>

<h2>셀렉트 박스</h2>
<div><%= sel1 %>
</div>

<h2>셀렉트 박스</h2>
<div><%= Arrays.toString(sel2) %>
</div>

<h2>히든 태그</h2>
<div><%= id %>
</div>

<h2>날짜</h2>
<div><%= regdate %>
</div>

<h2>색상</h2>
<div style="background-color: <%= color %>;"><%= color %>
</div>

<h2>고양이 위치</h2>
<div>
    left : <%= request.getParameter("left") %>
    top : <%= request.getParameter("top") %>
</div>


<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
<script src="https://bit.ly/4cMuheh"></script>
<script>

</script>
</body>
</html>