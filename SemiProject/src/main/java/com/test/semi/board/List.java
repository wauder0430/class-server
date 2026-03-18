package com.test.semi.board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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

		// list.do 호출
		// 1. list.do
		// 2. list.do?column=subject&word=aaa
		
		// <input type="text" name="name">
		// -req.getParameter("name")
		// -list.do		      > null
		// -list.do?name=hong > "hong"
		// -list.do?name=	  > ""	
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		String search = "n"; // 목록보기(n), 검색하기(y)
		
		if((column == null && word == null) || (word.trim().equals(""))) {
			search = "n";
		} else {
			search = "y";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("column", column);
		map.put("word", word);
		map.put("search", search);
		
		// 페이징
		// - list.do
		// - list.do?page=1
		// - list.do?page=2
		
		String page = req.getParameter("page");
		
		int nowPage = 0; 		// 현재 페이지 번호
		int totalCount = 0;		// 총 게시물 수
		int pageSize = 10;		// 한 페이지에서 보여줄 게시물 수
		int totalPage = 0;		// 총 페이지 수
		int begin = 0;			// 페이징 시작 위치(SQL)
		int end = 0;			// 페이징 끝 위치(SQL)
		int n = 0;				// 페이지바의 페이지 번호
		int loop = 0;			// 페이지바의 루프 변수
		int blockSize = 10;		// 페이지바의 페이지 수
		
		if(page == null || page.equals("")) {
			nowPage = 1;
		} else {
			nowPage = Integer.parseInt(page);
		}
		
		// - list.do?page=1 > where rnum between 1 and 10
		// - list.do?page=2 > where rnum between 11 and 20
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize -1;
		
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		map.put("nowPage", String.valueOf(nowPage));
		
		
		//List.java
		// 1. DB 작업 > select
		// 2. 결과 > JSP 호출하기
		
		HttpSession session = req.getSession();
		
		BoardService service = new BoardService();
		
		ArrayList<BoardDto> list = service.list(map);
		
		// 총 게시물 수?
		totalCount = service.getTotalCount(map);
		// System.out.println(totalCount);
		
		// 총 페이지 수?
		// - 262/10 = 26.2 > 27
		totalPage = (int)Math.ceil((double)totalCount / pageSize);
		// System.out.println(totalPage);
		
		map.put("totalCount", totalCount + "");
		map.put("totalPage", totalPage + "");
		
		
		// 페이지 바 생성하기
		String pagebar = "";
		
		pagebar = "";
		
		
		req.setAttribute("pagebar", pagebar);
		
		// 조회수 증가 방지 티켓
		session.setAttribute("read", "n");
		
		req.setAttribute("list", list);
		req.setAttribute("map", map);

		req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
	}

}
