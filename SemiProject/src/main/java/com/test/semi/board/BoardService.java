package com.test.semi.board;

import java.util.ArrayList;
import java.util.Calendar;

import com.test.semi.model.BoardDao;
import com.test.semi.model.BoardDto;
import com.test.semi.model.UserDto;

public class BoardService {

	public int add(BoardDto dto) {

		BoardDao dao = new BoardDao();
		
		return dao.add(dto);
	}

	public ArrayList<BoardDto> list() {

		BoardDao dao = new BoardDao();
		
		ArrayList<BoardDto> list = dao.list();
		
		Calendar now = Calendar.getInstance();
		String nowDate = String.format("%tF", now);
		
		// 데이터 조작(가공)
		for(BoardDto dto : list) {
			
			// 날짜 자르기 > 오늘 날짜?
			String regdate = dto.getRegdate();
			
			if(regdate.startsWith(nowDate)) {
				// 오늘 쓴 글
				regdate = regdate.substring(11);
			} else {
				// 옛날 쓴 글
				regdate = regdate.substring(0, 10);
			}			
			
			dto.setRegdate(regdate);
			
			
			// 제목에 HTML 태그 비활성화 
			String subject = dto.getSubject();
			
			subject = subject.replace("<", "&lt;").replace(">", "&gt;");
			
			
			
			// 제목 자르기
			
			if(subject.length() > 15) {
				subject = subject.substring(0, 15) + "..";
			}
			
			dto.setSubject(subject);
			
			
			
		}
		
		
		return list;
		// return dao.list();
	}

	public BoardDto get(String seq) {
		
		BoardDao dao = new BoardDao();
		
		BoardDto dto = dao.get(seq);
		
		// 데이터 가공
		// 개행 문자 처리
		String content = dto.getContent();
		
		content = content.replace("\r\n", "<br>");
		
		dto.setContent(content);
				
		return dto;

	}

	public void increaseReadcount(String seq) {
		
		BoardDao dao = new BoardDao();
		
		dao.increaseReadcount(seq);
		
	}

	public int edit(BoardDto dto) {
		
		BoardDao dao = new BoardDao();
		
		return dao.edit(dto);
	}

	public int del(String seq) {
		
		BoardDao dao = new BoardDao();
		
		return dao.del(seq);
	}

}
