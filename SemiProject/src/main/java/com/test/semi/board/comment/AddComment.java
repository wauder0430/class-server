package com.test.semi.board.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.semi.model.CommentDao;
import com.test.semi.model.CommentDto;

@WebServlet(value = "/board/addcomment.do")
public class AddComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AddComment.java
		
		HttpSession session = req.getSession();
		
		String content = req.getParameter("content");
		String bseq = req.getParameter("bseq");
		String id = (String)session.getAttribute("auth");
				
		CommentDto dto = new CommentDto();
		dto.setContent(content);
		dto.setBseq(bseq);
		dto.setId(id);
		
		CommentDao dao = new CommentDao();
		dao.add(dto);	
		
		//- view.do?seq=274&search=y&column=subject&word=멍멍
		
		resp.sendRedirect("/semi/board/view.do?seq=" + bseq );
		
	}

}