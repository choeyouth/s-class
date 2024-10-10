package com.test.toy.board.model;

import lombok.Data;

@Data
public class BoardDTO {
	
	private String seq;
	private String subject;
	private String content;
	private String regdate;
	private int readcount;
	private String id;
	
	private String regtime; //가공된 작성 시각
	private String name; //작성자 이름
	private double isnew; //최신글
	
}
