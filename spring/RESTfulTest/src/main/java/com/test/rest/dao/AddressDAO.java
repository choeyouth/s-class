package com.test.rest.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.test.rest.dto.AddressDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AddressDAO {

	private final SqlSessionTemplate template;

	public AddressDTO m1() {
		return template.selectOne("rest.m1");
	}

	public int add(AddressDTO dto) {
		return template.insert("rest.add", dto);
	}

	public List<AddressDTO> list() {
		return template.selectList("rest.list");
	}

	public int edit(AddressDTO dto) {
		return template.update("rest.edit", dto);
	}

	public int del(String seq) {
		return template.delete("rest.del", seq);
	}

	public List<AddressDTO> search(String word) {
		return template.selectList("rest.search", word);
	}
	
}
