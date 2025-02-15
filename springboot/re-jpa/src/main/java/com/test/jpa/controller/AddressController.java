package com.test.jpa.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	//Query Method
	//- 키워드 조합 > 메서드 이름 만들기
	//- 메서드명 = Subject Part + Predicate Part 
	//		   = 가져올 컬럼 + 조건
	
	//Select문
	//- findBy, getBy, QeuryBy, searchBy, streamBy 등
	//- findBy(***)
	@GetMapping("/m05.do")
	public String m05(Model model) {
		
		//메서드명 = findBy + Subject Part [+ Predicate Part]
		
		//'다람쥐' 검색
		//select * from tblAddress where name = '다람쥐'		
		//Optional<Address> address = addressRepository.findByName("다람쥐");
		
		//주소 검색
		//Optional<Address> address = addressRepository.findByAddress("서울특별시 강남구 역삼로 231, 역삼아파트 104동 5호");
		
		//성별 검색
		Optional<Address> address = addressRepository.findByGender("m");
		//결과: 오류 => 단일 행 쿼리만 가능함 
		
		model.addAttribute("dto", address.get().toDTO());
		
		return "result_dto";
	}
	
	//카운트
	@GetMapping("/m06.do")
	public String m06(Model model) {
		
		//카운트 
		long count = addressRepository.count();
		
		//레코드 존재 유무
		boolean result = addressRepository.existsById(1L);
		
		model.addAttribute("count", count);
		model.addAttribute("result", result);
		
		return "result_item";
	}
	
	//전체 Select
	@GetMapping("/m07.do")
	public String m07(Model model) {
		
		List<Address> list = addressRepository.findAll();
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	//First, Top
	//- 가져올 레코드의 개수를 지정한다.
	//- 키워드 뒤에 숫자를 지정한다ㅏ. 생략(1)
	//- 1이면 단수 반환, N이면 복수 반환
	@GetMapping("/m08.do")
	public String m08(Model model) {
		
		Address address = addressRepository.findByAge(3);
		
		model.addAttribute("dto", address.toDTO());
		return "resut_list";
	
		//자바 버전에 따라 다름 > 오류 발생 
	}
	
	
	//And, Or
	@GetMapping("/m09.do")
	public String m09(Model model) {

		
		//Address address = addressRepository.findByNameAndGender("강아지", "m");
		//List<Address> list = addressRepository.findByGenderAndAge("m", 3);
		List<Address> list = addressRepository.findByGenderOrAge("m", 6);
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	

	//크기 비교
	//After, Before, GreaterThan(GreaterThanEqual), LsssThan(LessThanEqual), Between
	//- After, GreaterThan(GreaterThanEqual) > 크다
	//- Before, LessThan(LessThanEqual) > 작다
	//- Between > 범위
	//- After/Before > 날짜 시간 비교
	
	//다중 정렬
	//find 오버로딩 된 sort 활용 방법 
	@GetMapping("/m15.do")
	public String m15(Model model) {
		
		//asc
		//List<Address> list = addressRepository.findAll(Sort.by("name"));
		
		//desc
		//List<Address> list = addressRepository.findAll(Sort.by(Sort.Direction.DESC, "name"));
		
		//다중 정렬 
		List<Address> list = addressRepository.findAll(Sort.by(
			Sort.Order.desc("age"),
			Sort.Order.asc("name")
		));
		
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	//페이징
	@GetMapping("/m17.do")
	public String m17(Model model) {
		
		PageRequest pageRequest = PageRequest.of(0, 10);
		//0: 페이지 수
		//10: 가져올 데이터 수 
		
		Page<Address> list = addressRepository.findAll(pageRequest);
		
		System.out.println(list.getNumber()); 
		System.out.println(list.getNumberOfElements());
		System.out.println(list.getTotalElements());
		System.out.println(list.getTotalPages());
		System.out.println(list.getSize());
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	@GetMapping("m18.do")
	public String m18(Model model, @RequestParam(name = "page", required = false, defaultValue = "1") Integer page) {
		   
		PageRequest pageRequest = PageRequest.of(page, 10, Sort.by("name"));
		
		Page<Address> list = addressRepository.findAll(pageRequest);
		
		StringBuilder sb = new StringBuilder();
		
		for (int i=1; i<=list.getTotalPages(); i++) {
			sb.append("""
					<a href="/m18.do?page=%d">%d</a>
					""".formatted(i, i));
		}
		
		model.addAttribute("list", list);
		model.addAttribute("sb", sb);
		
		return "result_list";
	}
	
	
	@GetMapping("/m19.do")
	public String m19(Model model, Pageable pageable) {
		
		Page<Address> list = addressRepository.findAll(pageable);
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	//Slice 페이징
	//- 대용량 데이터를 효율적으로 처리하기 위한 방법
	//- 전체 데이터 수를 생각하지 않고, 요청되 크기만큼의 데이터만 가져옴
	//- 인스타와 같이 주로 무한 스크롤이나 "더보기" 버튼과 같은 UI 패턴에서 사용됩니다. [이전페이지] [디음페이지]
	//<-> 다량의 데이터를 빨리 만들어야 할 때 1 2 3 4 5 ... 방식 사용
	
	@GetMapping("/m20.do")
	public String m20(Model model, Pageable pageable) {
		
		Slice<Address> list = addressRepository.findAll(pageable);
		
		StringBuilder sb = new StringBuilder();
		
		if (list.getNumber() != 0) {
			sb.append("""
				<a href="/m20.do?page=%d&size=10">이전 페이지</a>
				""".formatted(list.previousOrFirstPageable().getPageNumber()));
		}
		
		if (list.hasNext()) {
			sb.append("""
				<a href="/m20.do?page=%d&size=10">다음 페이지</a>
				""".formatted(list.nextOrLastPageable().getPageNumber()));
		
		}
		
		model.addAttribute("list", list);
		model.addAttribute("sb", sb);
		
		return "result_list";
	}
	
	
}

















