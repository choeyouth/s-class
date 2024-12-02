package com.rebook.user.model;

import lombok.Data;

@Data
public class MemberInfoDTO {

	private String seq;
	private String member_seq;
	private String name;
	private String tel;
	private String email;
	private String pic;
	private String address;
	private String addrDetail;
	private String zipcode;
	private String regDate;
	
}

