package com.test.security.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberDTO {

	private Long seq;
	private String username;
	private String password;
	private String role;
	
}
