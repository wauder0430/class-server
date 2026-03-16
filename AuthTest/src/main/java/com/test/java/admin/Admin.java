package com.test.java.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.java.model.AuthDto;

@WebServlet(value = "/admin/admin.do")
public class Admin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Admin.java
		HttpSession session = req.getSession();
		
		if(session.getAttribute("auth") == null || !((AuthDto)session.getAttribute("authDto")).getGrade().equals("2")) {
			resp.sendRedirect("/auth/index.do");
			return;
		}
		

		req.getRequestDispatcher("/WEB-INF/views/admin/admin.jsp").forward(req, resp);
	}

}
