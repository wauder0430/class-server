<%@ page import="com.test.java.MyUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    // 자바 영역
     
    // 자바 영역 > 이 영역은 어떤 영역? > 어떤 메서드의 {}
    // - 모든 스크립틀릿 영역은 하나의 {} 영역 안에 포함된다.

    // 지역 변수 vs 멤버 변수 > ? > 지역 변수
    int a = 10;
	
	/* 오류
	public void test(){
		
	}
	*/
	
	/* 중첩 클래스
	class Test {
	
	}
	*/

%>
<%!
    // 다른 영역 > 클래스 영역
    public int b = 20; // 사용 안함

    public int sum(int a, int b) {
        return a + b;
    }

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
<!-- ex04_declare -->

<%
    // 위의 스크립틀릿과 같은 영역

    System.out.println(a);

%>
<div><%= sum(a, 20) %>
</div>

<hr>

<%
    MyUtil util = new MyUtil();
%>
<div><%= util.sum(50, 50) %>
</div>

<script src="https://code.jquery.com/jquery-4.0.0.js"></script>
<script src="https://bit.ly/4cMuheh"></script>
<script>

</script>
</body>
</html>