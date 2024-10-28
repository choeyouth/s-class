package com.test.spring.mapper;

import java.util.List;

import com.test.spring.dto.BoardDTO;
import com.test.spring.dto.MemberDTO;

public interface BoardMapper {

	String getName(String id);

	MemberDTO loadUser(String username);

	int add(BoardDTO dto);

	List<BoardDTO> list();

	BoardDTO get(String seq);

	int edit(BoardDTO dto);

	int del(BoardDTO dto);
	
}
