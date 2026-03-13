package com.test.todo.model;

import java.util.ArrayList;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
//@Data
//@ToString
//@NoArgsConstructor..
public class TodoDTO {
	
	// 테이블의 컬럼
	private String seq;
	private String todo;
	private String state;
	private String regdate;
	
	
}
