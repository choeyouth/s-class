package com.test.jpa.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.test.jpa.entity.Address;
import com.test.jpa.entity.AddressNameAgeMapping;
import com.test.jpa.repository.AddressRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AddressController {

	private final AddressRepository addressRepository;

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
	
	@GetMapping("/m02.do")
	public String m02(Model model) {
		
		//C[R]UD
		//- 1개의 레코드를 가져오기 + 기본키 조건 
		Optional<Address> address = addressRepository.findById(2L);
		
//		if (address.isPresent()) { //address != null
//			model.addAttribute("dto", address.get().toDTO());
//		}

		//address.ifPresent(value -> model.addAttribute("dto", Address.toDTO(value)));
		address.ifPresent(value -> model.addAttribute("dto", value.toDTO()));
		
		return "result_dto";
	}
	
	@GetMapping("/m03.do")
	public String m03(Model model) {
		
		//CR[U]D
		//- 레코드 수정하기
		//방법 1. 엔티티 새로 만든 뒤 > 이 값으로 기존 레코드를 수정
		//방법 2. 기존 엔티티 검색 > 기존 엔티티 수정 > 레코드를 수정
		
		//52	꿀꿀이	5	서울특별시 강남구 역삼동 한독빌딩	m
//		Address address = Address.builder()
//							     .seq(52L)
//							     .name("황금꿀꿀이")
//							     .age(5)
//							     .address("서울특별시 강남구 역삼동 한독빌딩 8층")
//							     .gender("m")
//							     .build();

		Address address = addressRepository.findById(52L).get();
		address.updateAddress("서울특별시 강동구 천호동");
		
		Address result = addressRepository.save(address);
		
		model.addAttribute("dto", result.toDTO());
		
		return "result_dto";
	}
	
	
	@GetMapping("/m04.do")
	public String m04(Model model) {
		
		//CRU[D]
		//- 레코드 삭제하기
//		Address address = Address.builder()
//								 .seq(52L)
//								 .build();

		Address address = addressRepository.findById(53L).get();
		
		addressRepository.delete(address);
		
		return "result_dto";
	}
	
	//C > save(Entity)
	//R > findById(PK)
	//U > save(Entity)
	//D > delete(Entity) 
	
	@GetMapping("/m05.do")
	public String m(Model model) {
		
		//Query Method
		//- 키워드 조합 > 메서드 이름 만들기
		//- 메서드명 = Subject Part + Predicate Part
		//			 = 가져올 컬럼  + 조건
		//
		//Select문
		//- findBy, getBy, readyBy, QueryBy, searchBy, streamBy 등..
		//- findBy(***)
		//
		//메서드명 = findBy + Subject Part [+ Predicate Part]
		//
		//'다람쥐' 검색 
		//- select * from tblAddress where name = '다람쥐'
		//Optional<Address> address = addressRepository.findByName("다람쥐");
		//Optional<Address> address = addressRepository.findByAddress("서울특별시 강남구 역삼로 231, 역삼아파트 104동 5호");
		
		//Query did not return a unique result: 28 results were returned
		Optional<Address> address = addressRepository.findByGender("m");
		
		
		model.addAttribute("dto", address.get().toDTO());
		
		return "result_dto";
	}
	
	@GetMapping("/m06.do")
	public String m06(Model model) {
		
		//카운트
		long count = addressRepository.count();
		
		//레코드 존재 유무: count(*) > 0 
		boolean result = addressRepository.existsById(1L);
		
		model.addAttribute("count", count);
		model.addAttribute("result", result);
		
		return "result_item";
	}
	
	
	@GetMapping("/m07.do")
	public String m07(Model model) {
		
		//전체 select
		
		List<Address> list = addressRepository.findAll();
		
		//List<Entity> > (변환) > List<DTO>
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
//	@GetMapping("/m08.do")
//	public String m08(Model model) {
//		
//		//First, Top
//		//- 가져올 레코드의 개수를 지정한다.
//		//- 키워드 뒤에 숫자를 지정한다. 생략(1)
//		//- 1이면 단수 반환, N이면 복수 반환
//		
//		Address address = addressRepository.findFirstByAge(3);
//		
//		model.addAttribute("dto", address.toDTO());
//		return "result_list";
//	}

	@GetMapping("/m09.do")
	public String m09(Model model) {
		
		//And, Or
		
		//- where name = '강아지' and gender = 'm'
//		Address address = addressRepository.findByNameAndGender("강아지", "m");
//		model.addAttribute("dto", address.toDTO());
//		return "result_dto";

		
		//- where gender = 'm' and age = 3
		//- where gender = 'm' or age = 3
		
		List<Address> list = addressRepository.findByGenderOrAgeOrName("m", 3, "꿀꿀이");
		model.addAttribute("list", list);
		return "result_list";
	}
	
	@GetMapping("/m10.do")
	public String m10(Model model) {
		
		//After, Before, GreaterThan(GreaterThanEqual), LessThan(LessThanEqual), Between
		//- After, GreaterThan(GreaterThanEqual) > 크다
		//- Before, LessThan(LessThanEqual) > 작다
		//- Between > 범위
		//- After/Before > 날짜시간 비교
		//- GreaterThan/LessThan > 크기 비교
		
		//List<Address> list = addressRepository.findByAgeGreaterThan(5);
		//List<Address> list = addressRepository.findByAgeLessThan(5);
		//List<Address> list = addressRepository.findByAgeLessThanEqual(5);
		List<Address> list = addressRepository.findByAgeBetween(3, 5);
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	@GetMapping("/m11.do")
	public String m11(Model model) {
		
		//isEmpty, isNull
		//isNotEmpty, isNotNull
		//- isNull > null 체크
		//- isEmpty > 빈문자열, 컬렉션 size(0) 등을 체크
		
		//List<Address> list = addressRepository.findByAddressIsNull();
		List<Address> list = addressRepository.findByAddressIsNotNull();
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	@GetMapping("/m12.do")
	public String m12(Model model) {
		
		//In, NotIn
		//- 열거형 조건 
		
		List<Integer> age = List.of(3, 5, 7);
		
		//List<Address> list = addressRepository.findByAgeIn(age);
		List<Address> list = addressRepository.findByAgeNotIn(age);
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	@GetMapping("/m13.do")
	public String m13(Model model) {
		
		//StartingWith(StartsWith), EndingWith(EndsWith), Contains, Like
		
		//List<Address> list = addressRepository.findByAddressStartingWith("서울특별시 강남구");
		//List<Address> list = addressRepository.findByAddressStartsWith("서울특별시 강남구");
		//List<Address> list = addressRepository.findByAddressEndingWith("층");
		//List<Address> list = addressRepository.findByAddressContains("역삼");
		//List<Address> list = addressRepository.findByAddressLike("%타워%");
		List<Address> list = addressRepository.findByAddressNotLike("%타워%");
		
		model.addAttribute("list", list);
		return "result_list";
	}
	
	@GetMapping("/m14.do")
	public String m14(Model model) {
		
		//Is, Equals
		Optional<Address> address = addressRepository.findByName("강아지");
		//Optional<Address> address = addressRepository.findByNameIs("강아지");
		//Optional<Address> address = addressRepository.findByNameEquals("강아지");
		
		address.ifPresent(value -> model.addAttribute("dto", value.toDTO()));
		
		return "result_dto";
	}
	
	@GetMapping("/m15.do")
	public String m15(Model model) {
		
		//정렬
		//- OrderBy컬럼명Asc
		//- OrderBy컬럼명Desc
		
		//List<Address> list = addressRepository.findAllByOrderByNameAsc();
		
		//조건추가
		//List<Address> list = addressRepository.findByGenderOrderByNameAsc("m");
		//List<Address> list = addressRepository.findByGenderOrderByNameDesc("m");
		
		//다중 정렬 
		//- OrderBy컬럼명Asc컬럼명Desc컬럼명Asc
		//List<Address> list = addressRepository.findByGenderOrderByAgeAscNameDesc("m");
		//List<Address> list = addressRepository.findByGenderAndAgeOrderByAgeAscNameDesc("m", 3);
		 
		//List<Address> list = addressRepository.findAll(Sort.by(Sort.Direction.DESC, "name"));
		
		//다중 정렬
		//List<Address> list = addressRepository.findAll(Sort.by("age", "name"));
//		List<Address> list = addressRepository.findAll(Sort.by(
//			Sort.Order.desc("age"),
//			Sort.Order.asc("name")
//		));
	
		//List<Address> list = addressRepository.findByGender("m", Sort.by("age"));
		List<Address> list = addressRepository.findByGender(Sort.by("age"), "m");
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	
	//test(10);
	//test(10, 20);
	//test(10, 20, 30);
	
	//가변 인자 리스트
	public void test(String... args) {
		
		for (int i=0; i<args.length; i++) {
			System.out.println(i + ":" + args[i]);
		}
		
	}
	
	@GetMapping("/m16.do")
	public String m16(Model model) {
		
		//여태 Select
		//- select * from tblAddress
		
		//일부 컬럼만 가져오기 Select
		//- select name, age from tblAddress
		//- 인터페이스 사용 > 비용 발생 > 자주 사용X
		//- com.test.jpa.entity > "AddressNameAgeMapping.java" (I) > 원래 이름을 이렇게 짓지 않음
		
		//List<Address> list = addressRepository.findAllByGender("f");
		List<AddressNameAgeMapping> list = addressRepository.findAllByGender("f");
		
		model.addAttribute("list2", list);
		
		return "result_list";
	}
	
	/*
	@GetMapping("/m.do")
	public String m(Model model) {
		
		return "result";
	}
	*/
}
