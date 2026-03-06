package com.test.java;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ex02 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		PrintWriter writer = resp.getWriter();
		
		// 구구단 페이지 > 몇단 ? >랜덤
		
		Random rnd = new Random();
		int dan = rnd.nextInt(9)+1; // 1 ~ 9단
		
		// 현재 파일 > 자바 파일
		writer.printf("""
					<!DOCTYPE html>
					<html lang="ko">
					<head>
					    <meta charset="UTF-8">
					    <meta name="viewport" content="width=device-width, initial-scale=1.0">
					    <title>Document</title>
					    <style>
					        h1 {
					            border: 1px dashed gray;
					            width: 150px;
					            text-align: center;
					        }
					        div {
					            font-size: 1.2rem;
					            margin: 10px;
					        }
					    </style>
					</head>
					<body>
					    <!-- ex.html -->
					    <h1>구구단 <small>%d단</small></h1>
				""", dan);
		
				for(int i=1; i<=9; i++) {
					writer.printf("<div>%d x %d = %d</div>", dan, i, dan*i);
				}
					    
				writer.print("""				    
					    <script src="https://code.jquery.com/jquery-4.0.0.js"></script>
					    <script>
					        
					    </script>
					</body>
					</html>
						""");
					    
		
		writer.close();
	}
	
}
