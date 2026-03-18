package com.test.semi.board;

import com.test.semi.model.BoardDao;
import com.test.semi.model.BoardDto;

public class Dummy {
	
	public static void main(String[] args) {
		
		BoardDao dao = new BoardDao();
		
		//게시물 등록 > 250개 추가
		
		BoardDto dto = new BoardDto();
		
		dto.setContent("내용");
		dto.setId("hong");
		
		for (int i=0; i<250; i++) {
			dto.setSubject("게시판 페이징 예제입니다. " + i);
			dao.add(dto);
			System.out.println(i);
		}
		
	}
	
}


