package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ex03Ok extends HttpServlet {
	
	// 이 서블릿을 호출할 때 
	// 1. GET 방식으로 호출 > doGet() 실행
	// 2. POST 방식으로 호출 > doPost() 실행
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 클라이언트(브라우저)가 전송한 데이터 > 수신
		// - <input type="text name="txtID">
		String id = req.getParameter("txtID");
		
		PrintWriter writer = resp.getWriter();
		
		// - System.out.printf("문자열: %s, 숫자: %d, "홍길동", 10);
		// - String.format("문자열: %s, 숫자: %d, "홍길동", 10);
		// """
		// 문자열: %s, 숫자: %d
		// """.formatted("홍길동", 10);
		
		writer.println("""
					<!DOCTYPE html>
					<html lang="ko">
					<head>
					    <meta charset="UTF-8">
					    <meta name="viewport" content="width=device-width, initial-scale=1.0">
					    <title>Document</title>
					    <style>
					        
					    </style>
					</head>
					<body>
					    <!-- ex03Ok.do -->
					    <h1>데이터 수신하기</h1>
					    
					    <div>결과: %s</div>
					    
					    <script src="https://code.jquery.com/jquery-4.0.0.js"></script>
					    <script>
					        
					    </script>
					</body>
					</html>		
								
		""".formatted(id));
		
		writer.close();
	
	}

}