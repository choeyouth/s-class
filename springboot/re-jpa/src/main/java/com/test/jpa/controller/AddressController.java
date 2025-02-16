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
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.querydsl.core.Tuple;
import com.test.jpa.dto.AddressDTO;
import com.test.jpa.entity.Address;
import com.test.jpa.entity.Info;
import com.test.jpa.repository.AddressRepository;
import com.test.jpa.repository.CustomAddressRepository;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class AddressController {

	private final AddressRepository addressRepository;
	private final CustomAddressRepository customAddressRepository;
	
	
	//[C]RUD
	@GetMapping("/m1.do")
	public String m01(Model model) {
		
		Address address = new Address(null, "꿀꿀이가 자꾸 저장됩니다!!!!!", 5, "서울특별시 강남구 역삼동 한독빌딩", "m", null);
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
	
	
	//JPQL
	//- Query Method로 작업하기 힘든 작업들을 직접 SQL 작성을 통해서 구현 
	@GetMapping("/m21.do")
	public String m21(Model model) {

		//JPQL > @Query
		//1. Address(엔티티)를 대상으로 한다.
		//2. 반드시 엔티티의 별칭을 만든다.
		//3. 컬럼은 테이블 소속을 표시한다. 
		
		//List<String> names = addressRepository.listName();
		//model.addAttribute("names", names);
	
		//모든 레코드 가져오기
		//List<String> list = addressRepository.listAll("m");

		//조건 
		//List<String> list = addressRepository.listAll("m");
		//List<String> list = addressRepository.listAll(5);
		
		//조건 2개 > 다중 파라메터 넘기기
//		AddressDTO dto = AddressDTO.builder()
//								   .gender("f")
//								   .address("강남구")
//								   .build();
//		List<String> list = addressRepository.listAll(dto);
		
		//dto 넘기기
		List<AddressDTO> list = addressRepository.listCustomAll();
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	
	@GetMapping("/m22.do")
	public String m22(Model model) {
		
		/*
		 	
		 	QueryDSL (Domain Specific Language)
		 	- JPQL 작성을 도와주는 동적 쿼리 빌더(오픈 소스 라이브러리)
		 	
		 	JPQL을 직접 작성하지 않고 QueryDSL을 사용하는 이유?
		 	- JPQL은 문자열로 질의를 작성
		 	
		 	QClass 생성
		 	- 엔티티 클래스에 대응하는 정적 클래스 > QClass로부터 질의에 사용하는 여러 메서드를 제공받는다.
		 	
		 	QueryDSL 설정
		 	- 스프링 빈 선언
		 	- 자바 방식으로 빈 선언
		 	- "com.test.jpa.config" > "QueryDSLConfig.java"
		 	- QClass 생성하기
		 	
		 	파일
		 	- com.test.jpa.repository > "CustomAddressRepository.java"
		 	
		 */

		
		//전체 리스트 가져오기
		List<Address> list = customAddressRepository.findAll();
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	//단일 조회
	@GetMapping("/m23.do")
	public String m23(Model model) {
		
		//단일 조회 - 레코드 1개
		Address address = customAddressRepository.findAddressByName("강아지");
		model.addAttribute("dto", address.toDTO());
		
		return "result_dto";
	}
	
	//특정 컬럼 가져오기(1개)
	@GetMapping("/m24.do")
	public String m24(Model model) {
		
		List<String> names = customAddressRepository.findAllName();
		
		model.addAttribute("names", names);
		
		return "result_list";
	}
	
	//특정 컬럼 가져오기(N개) - Tuple 
	@GetMapping("/m25.do")
	public String m25(Model model) {
		
		//List<Address> list = customAddressRepository.findAllNameAndAgeAndGender();
		List<Tuple> tlist = customAddressRepository.findAllNameAndAgeAndGender();
		System.out.println(tlist);
		//[[꿀꿀이, 5, m], [강아지, 3, m], [고양이, 2, f], [병아리, 1, f], [사자, 7, m], [호랑이, 6, f], [비둘기, 3, f], [타조, 4, m], [햄스터, 1, m], [낙타, 5, m], [독수리, 3, m], [토끼, 4, m], [다람쥐, 2, f], [판다, 5, m], [기린, 7, f], [얼룩말, 3, m], [물개, 1, f], [코끼리, 8, m], [치타, 6, f], [여우, 3, m], [늑대, 4, f], [캥거루, 5, m], [하마, 9, f], [악어, 7, m], [독도새우, 2, f], [붉은여우, 6, m], [공작새, 5, f], [두루미, 4, m], [비버, 3, f], [오소리, 2, m], [고라니, 1, f], [말, 8, m], [돼지, 6, f], [닭, 3, m], [개구리, 4, f], [원숭이, 5, m], [양, 9, f], [염소, 7, m], [소, 2, f], [수달, 6, m], [고슴도치, 5, f], [사슴, 4, m], [북극곰, 3, f], [바다표범, 2, m], [미어캣, 1, f], [담비, 8, m], [코알라, 3, m], [캥거루, 4, f], [쥐, 5, m], [부엉이, 6, f], [코뿔소, 7, m], [꿀꿀이, 5, m], [꿀꿀이가 자꾸 저장됩니다!!!!!, 5, m], [꿀꿀이가 자꾸 저장됩니다!!!!!, 5, m]]

		for (Tuple tuple : tlist) {
			System.out.println(tuple.get(0, String.class));
			System.out.println(tuple.get(1, Integer.class));
			System.out.println(tuple.get(2, String.class));
			System.out.println();
		}
		
		model.addAttribute("tlist", tlist);
		return "result_list";
	}
	
	//일부 컬럼 가져오기(DTO)
	//1. Tuple
	//2. DTO 
	@GetMapping("/m26.do")
	public String m26(Model model) {
		
		List<AddressDTO> dlist = customAddressRepository.findAllNameAndAddress();
		
		model.addAttribute("dlist", dlist);
		
		return "result_list";
	}
	
	//where()절
	@GetMapping("/m27.do")
	public String m27(Model model) {
		
		List<Address> list = customAddressRepository.findAllByGender("m");
		model.addAttribute("list", list);
		return "result_list";
		
	}
	

	//정렬
	//- orderBy(QType.Column.정렬기준())
	
	//정렬기준
	//- asc()
	//- desc()
	//- nullsLast()
	//- nullsFirst()
	@GetMapping("/m28.do")
	public String m28(Model model) {
		
		List<Address> list = customAddressRepository.findAllOrderBy();
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	//페이징
	@GetMapping("/m29.do")
	public String m29(Model model, @RequestParam(defaultValue="1", name="page") Integer page) {
		
		int offset = (page - 1) * 10;
		List<Address> list = customAddressRepository.findAllPagenation(offset, 10);
		
		int count = customAddressRepository.count();
		StringBuilder sb = new StringBuilder();
		
		for(int i=1; i<=(int)Math.ceil(count/10.0); i++) {
			System.out.println(count); //54 > 컬럼 수 
			sb.append(String.format(" <a href='/m29.do?page=%d'>%d</a>", i, i));
		}
		
		model.addAttribute("sb", sb);
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	
	//집계 함수
	//count(*), avg(*), max, min
	@GetMapping("/m30.do")
	public String m30(Model model) {
		
		Tuple tuple = customAddressRepository.findAllAggregation();
		
		model.addAttribute("tuple", tuple);
		
		return "result_item";
	}
	
	
	//group by, having
	@GetMapping("/m31.do")
	public String m31(Model model) {
		
		List<Tuple> list = customAddressRepository.findAllGroupByGender();
		
		model.addAttribute("glist", list);
		
		return "result_list";
	}
	
	
	//JOIN
	@GetMapping("/m32.do")
	public String m32(Model model) {
		
		//class Info에 Address도 같이 있기 때문에 Info를 호출
		List<Info> list = customAddressRepository.findAllJoinInfo();
		
		model.addAttribute("joinInfoList", list);
		
		return "result_list";
	}

	//1:N Join
	@GetMapping("/m33.do")
	public String m33(Model model) {

		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();

		// 실행 코드
		//부모인 Address 엔티티를 가져와야 자식인 Memo를 참조할 수 있음 
		List<Address> list = customAddressRepository.findAllJoinAddress();

		model.addAttribute("joinAddressList", list);

		stopWatch.stop();
		System.out.println(stopWatch.prettyPrint());
		System.out.println("코드 실행 시간 (s): " + stopWatch.getTotalTimeSeconds());
		
		return "result_list";
	}
	

	//서브쿼리(Where)
	//서브쿼리 > QueryDSL
	//- where절 > 비교값 > DSL 구현 가능 
	//- select절 > 컬럼값 > DSL 구현 가능
	//- from절 > 테이블 > DSL 구현 불가
	
	
	//- where절 > 비교값 > DSL 구현 가능 
	@GetMapping("/m34.do")
	public String m34(Model model) {
		
		List<Address> list = customAddressRepository.findAllByMaxAge();
		
		model.addAttribute("list", list);
		
		return "result_list";
	}
	
	
	//- select절 > 컬럼값 > DSL 구현 가능 
	//select name, age, 평균나이 from tblAddress
	//select name, age, (select avg(age) from tblAddress) from tblAddress
	
	//1. DTO + 평균 나이 변수 추가
	//2. Tuple 방법으로 함
	@GetMapping("/m35.do")
	public String m35(Model model) {
		
		List<Tuple> talist = customAddressRepository.findAllByAvgAge();
		
		model.addAttribute("talist", talist);
		
		return "result_list";
	}
	
	
	//동적 쿼리
	//요청 받을 url 경우의 수 4개
	//1. m36.do > select * from tblAddress
	//2. m36.do?gender=m > select * from tblAddress where gender = 'm'
	//3. m36.do?age=3 > select * from tblAddress where age = 3
	//4. m36.do?gender=m&age=3 > select * from tblAddress where gender = 'm' and age = 3
	@GetMapping("/m36.do")
	public String m36(Model model
			, @RequestParam(name = "gender", required = false) String gender
			, @RequestParam(name = "age", required = false) Integer age) { 
		
		//required = true > 매개변수 필수 여부 
		//-> 기본적으로 true
		//-> 필수가 아니라면 false로 바꿔주어야 함
		//=> age, gender를 넘길 수도, 넘기지 않을 수도 있는 상황 
		
		System.out.println(gender);
		System.out.println(age);
		
		List<Address> list = customAddressRepository.findAllMultiParameter(gender, age);
		model.addAttribute("list", list);
		return "result_list";
	}
	
	
}

















