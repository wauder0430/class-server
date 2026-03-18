package com.test.semi.board.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.semi.model.CommentDao;

@WebServlet(value = "/board/delcomment.do")
public class DelComment extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//DelComment.java
		
		String seq = req.getParameter("seq");
		String bseq = req.getParameter("bseq"); 
		
		CommentDao dao = new CommentDao();
		
		dao.del(seq);

		// 부모의 글 번호를 매개로 view로 돌아간다.
		resp.sendRedirect("/semi/board/view.do?seq=" + bseq);
		
	}

}
