<%@ page import="java.util.HashMap" %>
<%@ page import="com.test.java.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
<!-- ex20_el.jsp -->
    <h1>EL</h1>
    <%
        // 자바 변수
        int a = 10;

        // 내장 객체 변수
        pageContext.setAttribute("b", 20);
        request.setAttribute("c", 30);
        session.setAttribute("d", 40);
        application.setAttribute("e", 50);
        session.setAttribute("c", 300);

        // EL
        // - ${내장 객체의 key}
        // - 지역 변수 출력은 불가능
        // - 내장 객체 변수 출력 전용 구문(***)

        // EL의 키 > 우선 순위
        // - pageContext > request > session > application
    %>

    <h2>표현식</h2>
    <div>a: <%= a%></div>
    <div>b: <%= pageContext.getAttribute("b")%></div>
    <div>b: <%= request.getAttribute("c")%></div>
    <div>b: <%= session.getAttribute("d")%></div>
    <div>b: <%= application.getAttribute("e")%></div>

    <h2>EL</h2>
    <div>a: ${a}</div>
    <%--  <div>b: ${pageContext.getAttribute("b")}</div> --%>
    <div>c: ${request.getAttribute("c")}</div> <%-- X --%>

    <div>b: ${b}</div>
    <div>c: ${c}</div>
    <div>d: ${d}</div>
    <div>e: ${e}</div>

    <div>b: ${pageScope.b}</div>
    <div>c: ${requestScope.c}</div>
    <div>c: ${sessionScope.c}</div>
    <div>d: ${sessionScope.d}</div>
    <div>e: ${applicationScope.e}</div>

    <hr>

    <h2>EL 기능</h2>

    <h3>연산 기능</h3>

    <%
        pageContext.setAttribute("n1", 10);
        pageContext.setAttribute("n2", 3);

    %>

    <div>n1 + 10 = <%= (int)pageContext.getAttribute("n1") + 10 %></div>
    <div>n1 + 10 = ${n1 + 10}</div>

    <div>n1 + n2 = <%= (int)pageContext.getAttribute("n1") + (int)pageContext.getAttribute("n2")%></div>
    <div>n1 + n2 = ${n1+n2}</div>
    <div>n1 - n2 = ${n1-n2}</div>
    <div>n1 * n2 = ${n1*n2}</div>
    <div>n1 / n2 = ${n1/n2}</div>
    <div>n1 % n2 = ${n1 % n2}</div>
    <div>n1 mod n2 = ${n1 mod n2}</div>

    <hr>

    <div> &lt; 기호는 작다라는 표현입니다.</div>
    <div> &lt;br&gt; 태그는 개행입니다.</div>

    <div>n1 > n2 = ${n1 > n2}</div>
    <div>n1 >= n2 = ${n1 >= n2}</div>
    <div>n1 < n2 = ${n1 < n2}</div>
    <div>n1 <= n2 = ${n1 <= n2}</div>
    <div>n1 == n2 = ${n1 == n2}</div>
    <div>n1 != n2 = ${n1 != n2}</div>

    <hr>

    <div>${true and true}</div>
    <div>${true or false}</div>
    <div>${not true}</div>

    <hr>

    <%-- <div>${"홍길동".equals("홍길동")}</div> --%>
    <div>${"홍길동" == "홍길동"}</div>

    <hr>

    <%
        HashMap<String, String> map = new HashMap<>();
        map.put("name", "홍길동");
        map.put("gender", "남자");
        map.put("address", "서울시");

        pageContext.setAttribute("map",map);//(***)
    %>


    <h3>객체 요소/멤버 접근 표현</h3>
    <div>${map}</div>

    <ul>
        <li>이름: <%= map.get("name")%></li>
        <li>성별: <%= map.get("gender")%></li>
        <li>주소: <%= map.get("address")%></li>
    </ul>

    <ul>
        <li>이름: ${map.get("name")}</li>
        <li>성별: ${map["gender"]}</li>
        <li>주소: ${map.address}</li>
    </ul>

    <%
        Student s1 = new Student();

        s1.setName("아무개");
        s1.setGender("남자");
        s1.setAddress("서울시");

        pageContext.setAttribute("s1", s1);
    %>

    <ul>
        <li>이름: <%= s1.getName()%></li>
        <li>성별: <%= s1.getGender()%></li>
<%--        <li>주소: <%= s1.getAddress()%></li>--%>
    </ul>

    <ul>
        <li>이름: ${s1.getName()}</li>
        <li>성별: ${s1["gender"]}</li>
        <li>주소: ${s1.test}</li> <%--javax.el.PropertyNotFoundException: [com.test.java.Student] 유형에서 [address] 특성을 읽을 수 없습니다.--%>
    </ul>

    <%
        Student s3 = null;
        String txt1 = null;
        String txt2 = "";

        pageContext.setAttribute("s3", s3);
        pageContext.setAttribute("txt1", txt1);
        pageContext.setAttribute("txt2", txt2);
    %>

    <div>${s3 == null}</div>
    <div>${txt1 == null}</div>
    <div>${txt2 == ""}</div>
    <div>${txt1 == null or txt1 == ""}</div>

    <div>{empty s3}</div>
    <div>{empty txt1}</div>
    <div>{empty txt2}</div>




    <script src="https://code.jquery.com/jquery-4.0.0.js"></script>
    <script src="https://bit.ly/4cMuheh"></script>
    <script>

    </script>
</body>
</html>
