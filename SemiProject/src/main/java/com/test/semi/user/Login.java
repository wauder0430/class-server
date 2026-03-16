package com.test.semi.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.semi.model.UserDto;

@WebServlet(value = "/user/login.do")
public class Login extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Login.java
		

		req.getRequestDispatcher("/WEB-INF/views/user/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//LoginOk.java(처리)
		// 1. 데이터 가져오기(id, pw) << 여기까진 controller역할
		// 2. DB작업 > select
		// 3. 결과 > 인증 티켓 발급
		// 4. 마무리
		
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		// 계층간 이동에는 dto에 담기
		UserDto dto = new UserDto();
		dto.setId(id);
		dto.setPw(pw);
		
		// 웹 > req, resp, session 사용
		// 웹에 관련된 특성있는 업무 > 서블릿
		// 웹과 무관한 일반적인 업무 > 서비스
		UserService service = new UserService();
		UserDto result = service.login(dto);
		
		if(result != null) {
			// 성공 > 인증 티켓 발급
			session.setAttribute("auth", id);
			// 개인 정보(회원명, 회원등급)
			session.setAttribute("authDto", result); // id, name, lv
			
			resp.sendRedirect("/semi/index.do");
		} else {
			// 실패
			resp.getWriter().print("<script>alert('failed');history.back();</script>");
			resp.getWriter().close();
		}
	
		
	}

}