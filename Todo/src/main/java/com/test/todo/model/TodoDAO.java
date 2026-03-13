package com.test.todo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

// 모든 데이터를 조작하는 담당자
// - JDBC 코드 작업 담당자
public class TodoDAO {
	
	private DBUtil util;
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public TodoDAO() {
		
		try {
			util = new DBUtil();
			conn = util.open();
			stat = conn.createStatement();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	// 할일 등록하기
	public int add(String todo) {
		try {
			
			String sql = "INSERT INTO tblTodo (seq, todo, state, regdate) VALUES (seqTodo.nextval, ?, DEFAULT, DEFAULT)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, todo);
			
			int result = pstat.executeUpdate();
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return 0;
		
	}
	
	public ArrayList<TodoDTO> list() {
		try {
			String sql = "select * from tblTodo order by seq desc";
			
			rs = stat.executeQuery(sql);
			
			// DTO: 레코드 1줄 역할
			// List<DTO>: 테이블 역할
			
			ArrayList<TodoDTO> list = new ArrayList<>();
			
			while(rs.next()) {
				//레코드 1줄 > (복사) > TodoDTO 1개
				TodoDTO dto = new TodoDTO();
				
				// 복사
				dto.setSeq(rs.getString("seq"));
				dto.setTodo(rs.getString("todo"));
				dto.setState(rs.getString("state"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
				
			}
			
			stat.close();
			conn.close();
			
			return list;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
		
	}
	
	public int check(TodoDTO dto) {
		try {
			String sql = "update tblTodo set state = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getState());
			pstat.setString(2, dto.getSeq());
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return 0;
	}

	public int del(String seq) {
		try {
			String sql = "delete from tblTodo where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			int result = pstat.executeUpdate();
			
			pstat.close();
			conn.close();
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	

}
