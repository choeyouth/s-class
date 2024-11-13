package com.test.thymeleaf.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.test.thymeleaf.domain.AddressDTO;

@Mapper
public interface AddressMapper {

	int num();
	
	String txt();

	AddressDTO get();

}
