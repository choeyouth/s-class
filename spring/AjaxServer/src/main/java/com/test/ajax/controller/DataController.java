package com.test.ajax.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.test.ajax.dto.UserDTO;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
@Api(value = "유저 API 컨트롤러", description = "유저 데이터 REST API")
public class DataController {

	//DB 역할 
	private static List<UserDTO> list;
	
	static {

		list = new ArrayList<UserDTO>();
		
		UserDTO dto1 = new UserDTO("dog", "강아지", "남자");
		UserDTO dto2 = new UserDTO("cat", "고양이", "여자");
		UserDTO dto3 = new UserDTO("tiger", "호랑이", "남자");

		list.add(dto1);
		list.add(dto2);
		list.add(dto3);
		
	}
	
	
	//목록보기
	@ApiOperation(value = "목록보기", notes = "유저 정보 목록을 반환합니다.")
	@GetMapping("/user")
	public List<UserDTO> list() {
		return list;
	}
	

	//@ResoponseBody
	// - 서버 > (JSON) > 클라이언트
	
	//@RequestBody
	// - 클라이언트 > (JSON) > 서버
	
	//추가하기
	@ApiOperation(value = "추가하기", notes = "유저 정보를 데이터 소스에 추가합니다.")
	@PostMapping("/user")
	public int add(@RequestBody UserDTO dto) {
		list.add(dto);
		return 1;
	}
	
	
	//상세보기
	@ApiOperation(value = "상세보기", notes = "특정 유저 정보를 반환합니다.")
	@ApiResponses({
		@ApiResponse(code = 200, message = "성공", response = UserDTO.class),
		@ApiResponse(code = 404, message = "유저를 찾을 수 없습니다.")
	})
	@GetMapping("/user/{id}")
	public UserDTO get(@ApiParam(value = "유저 데이터", required = true) @PathVariable("id") String id) {
		
		for (int i=0; i<list.size(); i++) {
			if (list.get(i).getId().equals(id)) {
				return list.get(i);
			}
		}
		
		return null;
	}
}
