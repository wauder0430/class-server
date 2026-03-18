package com.test.semi.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardDto {
	
	private String seq;
	private String subject;
	private String content;
	private String id;
	private String regdate;
	private String readcount;
	
	private String name;	// 작성자
	private Double isnew;	// 최신글
	private String commentCount; // 댓글수
	
}
