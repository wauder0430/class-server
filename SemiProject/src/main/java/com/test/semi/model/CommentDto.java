package com.test.semi.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentDto {
	
	private String seq;
	private String content;
	private String regdate;
	private String id;
	private String bseq;
	
	private String name;
}
