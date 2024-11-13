package com.test.mybatis.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.test.mybatis.domain.AddressDTO;

@Mapper
public interface AddressMapper {

	String time();
	List<AddressDTO> list();
	
}
