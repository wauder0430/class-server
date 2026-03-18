package com.test.semi.board.comment;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.semi.model.CommentDao;
import com.test.semi.model.CommentDto;

@WebServlet(value = "/board/editcomment.do")
public class EditComment extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EditComment.java
		String seq = req.getParameter("seq");
		String bseq = req.getParameter("bseq");
		String content = req.getParameter("content");
		
		CommentDto dto = new CommentDto();
		dto.setSeq(seq);
		dto.setBseq(bseq);
		dto.setContent(content);
		
		CommentDao dao = new CommentDao();
		
		dao.edit(dto);

		// 부모의 글 번호를 매개로 view로 돌아간다.
		resp.sendRedirect("/semi/board/view.do?seq=" + bseq);
	}

}
