package com.test.semi.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.test.semi.model.UserDao;
import com.test.semi.model.UserDto;

@WebServlet(value = "/user/register.do")
public class Register extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Register.java(폼 페이지-입력 역할)
		
		req.getRequestDispatcher("/WEB-INF/views/user/register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Register.java(데이터 처리 페이지) 
		// 1. 데이터 가져오기
		// 2. 첨부 파일 처리하기
		// 3. DB 작업 > insert
		// 4. 마무리
		
		UserService service = new UserService();
		
		int result = service.register(req);
		
		if(result>0) {
			resp.sendRedirect("/semi/index.do");
		} else {
//			resp.setContentType("text/html");
//			resp.setCharacterEncoding("UTF-8");
			resp.getWriter().print("<script>alert('failed');history.back();</script>");
			resp.getWriter().close();
		}
		
		
		
		
		
	}

}
