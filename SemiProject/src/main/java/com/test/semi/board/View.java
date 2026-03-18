package com.test.semi.board;

import java.io.IOException;
import java.util.HashMap;

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
		String search = req.getParameter("search");
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("column", column);
		map.put("word", word);
		map.put("search", search);
		
		BoardService service = new BoardService();
		
		// 조회수 + 1
		if(session.getAttribute("read") != null && session.getAttribute("read").toString().equals("n")) {
			service.increaseReadcount(seq);
			session.setAttribute("read", "y");
		}
		
		BoardDto dto = service.get(seq);
		
		// 예외 > 서비스의 업무지만 컨트롤러에서 작업
		if(search.equals("y") && (column.equals("content") || column.equals("all"))) {
			
			// 검색어 부각시키기
			// - 안녕하세요. 홍길동입니다. > 홍길동 검색일시
			// - 안녕하세요. <span style="background-color: gold; color:tomato;">홍길동</span>입니다.
			
			String content = dto.getContent();
			
			content = content.replace(word, "<span style=\"background-color: gold; color:tomato;\">" + word +"</span>");
			
			dto.setContent(content);
			
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("map", map);
		
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp").forward(req, resp);
	}

}
