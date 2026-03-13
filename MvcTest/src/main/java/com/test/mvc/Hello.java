package com.test.mvc;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
  	MVC
  	- Model
  		- 데이터 조작/관리/전달 역할
  		- 서블릿 > (데이터 전달: req) > JSP 
  		
  	- View
  		- JSP
  		- 화면을 만드는 역할
  		- HTML 페이지 만드는 역할
  	- Controller
  		- 서블릿
  		- 클라이언트 요청을 받고 HTML을 돌려주는 역할
  		- 전체 흐름을 통제하는 역할
  
*/
public class Hello extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//업무 구현..
		//- DB 작업 > select count(*)
		int count = 10;
		
		//PrintWriter > HTML 제작
		//JSP 위임    > HTML 제작
		
		//Servlet > (이동) > JSP
		//resp.sendRedirect("/mvc/hello.jsp");
		//pageContext.forward("/mvc/hello.jsp");
		
		// Servlet > (데이터 전달) > JSP
		// - 인수인계
		req.setAttribute("count", count);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/hello.jsp");
		dispatcher.forward(req, resp);		
		
	}

}









