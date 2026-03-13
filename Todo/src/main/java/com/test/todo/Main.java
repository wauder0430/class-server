package com.test.todo;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.todo.model.TodoDAO;
import com.test.todo.model.TodoDTO;

@WebServlet(value = "/main.do")
public class Main extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 
		//Main.java
		// 1. DB 작업 > DAO 위임 > select 
		// 2. 결과셋 
		// 3. JSP 호출(+결과셋)
		
		// 1. 
		TodoDAO dao = new TodoDAO();
		
		// ResultSet > JDBC 코드 JSP Model 2 위반
		// ResultSet rs = dao.list(); 
		
		// ResultSet(테이블) > (자료 구조 변환) > ArrayList<자료구조> 
		
		ArrayList<TodoDTO> list = dao.list();
		
		//[com.test.todo.model.TodoDTO@128edfce, com.test.todo.model.TodoDTO@6e0c8729, com.test.todo.model.TodoDTO@32be4007, com.test.todo.model.TodoDTO@51458d05, com.test.todo.model.TodoDTO@3551584c]

		// System.out.println(list);
		// req.setAttribute("rs", rs);
		req.setAttribute("list", list);

		req.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(req, resp);
	}

}
