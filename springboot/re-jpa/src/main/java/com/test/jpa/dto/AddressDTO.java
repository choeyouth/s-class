package com.test.jpa.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressDTO {

	private Long seq;
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
}
