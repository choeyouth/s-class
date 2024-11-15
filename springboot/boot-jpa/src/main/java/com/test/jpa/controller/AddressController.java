package com.test.jpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.jpa.entity.Address;
import com.test.jpa.repository.AddressRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AddressController {

	private final AddressRepository addressRepository;
	
	/*
	@GetMapping("/m.do")
	public String m(Model model) {
		
		return "result";
	}
	*/

	@GetMapping("/m01.do")
	public String m01(Model model) {
	
		/*
		 	
		 	JPA 사용법
			1. Query Method
			    - 정해진 키워드 + 메서드명 > 호출 > SQL 실행
			2. JPQL
			    - 직접 SQL 작성 > 실행
			3. Query DSL
			    - SQL 관련 각각의 조작을 자바 메소드를 통해서 실행
		 		
		 */
		
		//[C]RUD
		//- 레코드 추가하기 > insert
		//1. 추가할 레코드 정보 확보
		//2. 엔티티 객체 생성  
		//3. 리포지토리 객체 + 엔티티 객체 전달 > insert 요청
		
		Address address = new Address(null, "꿀꿀이", 5, "서울특별시 강남구 역삼동 한독빌딩", "m");
		//값 타입이 아닌 참조형Long을 붙였기 때문에 null 가능 
		//추후에 있을 변화나 이슈에 대비하기 위해 참조형이 더 현명한 선택!!!!
		
		Address result = addressRepository.save(address);
		 
		//Controller > (전달) > View
		//- Address 엔티티 > (변환) > AddressDTO
		model.addAttribute("dto", result.toDTO());
		
		return "result_dto";
	}
	
}
