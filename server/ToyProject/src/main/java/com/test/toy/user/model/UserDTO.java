package com.test.toy.user.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter 
@Getter
@ToString
public class UserDTO {
	
	private String id;
	private String pw;
	private String name;
	private String email;
	private String lv;
	private String pic;
	private String intro;
	private String regdate;
	private String ing;

}
