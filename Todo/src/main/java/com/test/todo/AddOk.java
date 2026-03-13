package com.test.todo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.todo.model.TodoDAO;

@WebServlet(value = "/addok.do")
public class AddOk extends HttpServlet {

	// HTTP 상태 405 – 허용되지 않는 메소드 doGet
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//AddOk.java
		// 1. 데이터 가져오기(todo)
		// 2. DB 작업 > insert 
		// 3. JSP 호출
		
		// 1.
		req.setCharacterEncoding("UTF-8");
		String todo = req.getParameter("todo");
		
		// System.out.println(todo);
		
		// 2. DB 코드 > DAO(Data Access Object) 클래스
		TodoDAO dao = new TodoDAO();
		int result = dao.add(todo); // 성공(1), 실패(0)
				
		// 3. 
		req.setAttribute("result", result);
		
		req.getRequestDispatcher("/WEB-INF/views/addok.jsp").forward(req, resp);
	}

}
