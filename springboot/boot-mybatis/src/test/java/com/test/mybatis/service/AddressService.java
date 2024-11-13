package com.test.mybatis.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.mybatis.domain.AddressDTO;
import com.test.mybatis.mapper.AddressMapper;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class AddressService {

	private AddressMapper mapper;
	
	public List<AddressDTO> list() {
		return mapper.list();
	}

}
