package com.test.code.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.test.code.dto.CodeDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CodeDAO {

	private final SqlSessionTemplate template;

	public int add(CodeDTO dto) {
		
		return template.insert("code.add", dto);
	}

	public List<CodeDTO> list() {

		return template.selectList("code.list");
	}

	public CodeDTO view(String seq) {

		return template.selectOne("code.view", seq);
	}
	
}
