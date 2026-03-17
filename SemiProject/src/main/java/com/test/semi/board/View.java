package com.test.semi.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.semi.model.BoardDto;
import com.test.semi.model.UserDto;

@WebServlet(value = "/board/view.do")
public class View extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//View.java
		// 1. 데이터 가져오기(seq)
		// 2. DB 작업 > select 
		// 3. 결과 + jsp 호출하기
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		BoardService service = new BoardService();
		
		// 조회수 + 1
		if(session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")) {
			service.increaseReadcount(seq);
			session.setAttribute("read", "y");
		}
		
		BoardDto dto = service.get(seq);
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp").forward(req, resp);
	}

}
