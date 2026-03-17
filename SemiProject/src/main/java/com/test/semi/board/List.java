package com.test.semi.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.semi.model.BoardDto;

@WebServlet(value = "/board/list.do")
public class List extends HttpServlet {

	// *** 컨트롤러: 데이터 수신 + 계층 제어 + 뷰 호출 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//List.java
		// 1. DB 작업 > select
		// 2. 결과 > JSP 호출하기
		
		HttpSession session = req.getSession();
		
		BoardService service = new BoardService();
		
		ArrayList<BoardDto> list = service.list();
		
		// 조회수 증가 방지 티켓
		session.setAttribute("read", "n");
		
		req.setAttribute("list", list);

		req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
	}
	
	

}
