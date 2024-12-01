package com.test.oauth2.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserDTO {

	private String username; //id
	private String name; 	 //이름
	private String role;
	
}
