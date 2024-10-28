package com.test.spring.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardDTO {

	private String seq;
	private String subject;
	private String content;
	private String regdate;
	private String memberid;
	
}
