package com.test.jpa.controller;

import java.util.Optional;

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
	
	//[C]RUD
	@GetMapping("/m1.do")
	public String m01(Model model) {
		
		Address address = new Address(null, "꿀꿀이가 자꾸 저장됩니다!!!!!", 5, "서울특별시 강남구 역삼동 한독빌딩", "m");
		//값형이 아닌 참조형 Long을 붙였기 때문에 null 가능 
		//추후에 있을 변화나 이슈에 대비하기 위해 참조형이 더 현명한 선택 
		
		Address result = addressRepository.save(address); 
		
		addressRepository.save(address);
		
		model.addAttribute("dto", result.toDTO());
		
		return "result_dto";
	}
	
	
	//C[R]UD
	//1개의 레코드를 가져오기 + 기본키 조건
	@GetMapping("/m02.do")
	public String m2(Model model) {
		
		Optional<Address> address = addressRepository.findById(54L);
		
		
		//1. 
//		if (address.isPresent()) { //address != null 
//			model.addAttribute("dto", address.get().toDTO());
//		}
		
		//2. 
		//address.ifPresent(value -> model.addAttribute("dto", Address.toDTO(value)));
		
		//3.
		address.ifPresent(value -> model.addAttribute("dto", value.toDTO()));
		
		return "result_dto";
	}
	
	
	//CR[U]D
	//레코드 수정하기 
	//방법1. 엔티티 새로 만든 뒤 > 이 값으로 기존 레코드를 수정
	//방법2. 기존 엔티티 검색 > 기존 엔티티 수정 > 레코드를 수정
	
	
	@GetMapping("/m03.do")
	public String m03(Model model) {
		
		//방법1.
//		Address address = Address.builder()
//						.seq(52L)
//						.name("황금수정꿀꿀이")
//						.age(5)
//						.address("서우우웅 ")
//						.gender("m")
//						.build();
		
		//방법2. 
		Address address = addressRepository.findById(52L).get();
		address.updateAddress("주소 변경 ");
		
		Address result = addressRepository.save(address);
		
		model.addAttribute("dto", result.toDTO());
		
		return "result_dto";
	}
	
	
	//CRU[D]
	//레코드 삭제하기
	@GetMapping("/m04.do")
	public String m04(Model model) {
		
		
		//방법1. 
//		Address address = Address.builder()
//						.seq(56L)
//						.build();
		
		//방법2.
		Address address = addressRepository.findById(57L).get();
		
		addressRepository.delete(address);
		
		return "result_dto";
	}
}
