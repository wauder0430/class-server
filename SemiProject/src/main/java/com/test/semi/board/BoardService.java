package com.test.semi.board;

import java.util.ArrayList;
import java.util.Calendar;

import com.test.semi.model.BoardDao;
import com.test.semi.model.BoardDto;

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
			
			// 제목 자르기
			String subject = dto.getSubject();
			
			if(subject.length() > 15) {
				subject = subject.substring(0, 15) + "..";
			}
			
			dto.setSubject(subject);
		}
		
		
		return list;
		// return dao.list();
	}

}
