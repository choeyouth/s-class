package com.test.thymeleaf.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.test.thymeleaf.domain.AddressDTO;

@Mapper
public interface AddressMapper {

	int num();
	
	String txt();

	AddressDTO get();

	List<String> names();

	List<AddressDTO> list();

}
