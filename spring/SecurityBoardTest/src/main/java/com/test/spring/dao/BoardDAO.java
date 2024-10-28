package com.test.spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.spring.dto.BoardDTO;
import com.test.spring.mapper.BoardMapper;

@Repository
//@RequiredArgsConstructor
public class BoardDAO {

	@Autowired
	private BoardMapper mapper;
	
	//글쓰기 
	public int add(BoardDTO dto) {
		
		return mapper.add(dto);
	}

	public List<BoardDTO> list() {
		
		return mapper.list();
	}

	public BoardDTO get(String seq) {
		
		return mapper.get(seq);
	}

	public int edit(BoardDTO dto) {
		return mapper.edit(dto);
	}

	public int del(BoardDTO dto) {
		return mapper.del(dto);
	}
}
