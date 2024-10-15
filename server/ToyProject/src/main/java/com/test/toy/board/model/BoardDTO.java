package com.test.toy.board.model;

import java.util.ArrayList;

import lombok.Data;

@Data
public class BoardDTO {
	
	private String seq;
	private String subject;
	private String content;
	private String regdate;
	private int readcount;
	private String id;
	
	private String regtime;		 //가공된 작성 시각
	private String name; 		 //작성자 이름
	private double isnew;		 //최신글
	
	private String commentCount; //댓글 수
	private int thread;			 //답변형
	private int depth;			 //답변형
	private int ing;			 //삭제유무
	private String attach; 	     //첨부파일(사진)

	private ArrayList<String> tag; //해시 태그
	private int istag;			   //매핑된 해시 태그 개수
	
}
