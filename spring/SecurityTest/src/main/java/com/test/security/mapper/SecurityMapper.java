package com.test.security.mapper;

import org.apache.ibatis.annotations.Select;

import com.test.security.dto.MemberDTO;

public interface SecurityMapper {

	@Select("select sysdate from dual")
	String time1();

	String time2();

	MemberDTO loadUser(String username);
	
}
