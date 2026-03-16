package com.test.semi.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.semi.model.UserDto;

@WebServlet(value = "/user/info.do")
public class Info extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Info.java
		// 1. DB작업 > select
		// 2. JSP호출하기(+UserDto)
		HttpSession session = req.getSession();
		
		UserService service = new UserService();
		
		UserDto dto = service.info((String)session.getAttribute("auth"));
		
		req.setAttribute("dto", dto);

		req.getRequestDispatcher("/WEB-INF/views/user/info.jsp").forward(req, resp);
	}

}