package com.test.jpa.entity;

import com.test.jpa.dto.AddressDTO;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

//Entity
//- 데이터베이스의 테이블의 참조 객체
//- DB의 tblAddress 테이블과 연결된 객체 
//- 엔티티에는 Setter를 구현 안 함 > 생성자로 구현 
//- 엔티티에는 필요에 따라 Getter는 구현 가능함. 
@Entity
@Getter
@ToString
@Table(name = "tblAddress") //진짜 오라클의 테이블 이름 > 매핑 > jpa가 스네이크 표기법으로 만들어버림(tbl_address)
@Builder
@NoArgsConstructor //파라미터가 없는 디폴트 생성자를 자동으로 생성한다. 
@AllArgsConstructor //클래스의 모든 필드 값을 파라미터로 받는 생성자를 자동으로 생성한다.
//@RequiredArgsConstructor //final이 붙은 아이에게 생성자
public class Address {
	
	//기본키(PK) 설정(@Id, @GeneratedValue, @SequenceGenerator 필수)
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "address_seq_generator") //DB 특성에 맞게 시퀀스 값 처리(MySql > AUTO, oracle > SEQUENCE)
	@SequenceGenerator(name="address_seq_generator", sequenceName = "seqAddress", allocationSize = 1) //seq.nextVal과 같은 역할을 하기 위함
	private Long seq;
	
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	//Entity(본인) > (변환) > DTO
	public static AddressDTO toDTO(Address address) {

//		AddressDTO dto = new AddressDTO();
//		dto.setSeq(address.getSeq());
//		dto.setName(address.getName());
//		dto.setAge(address.getAge());
//		dto.setAddress(address.getAddress());
//		dto.setGender(address.getGender());

		
		return AddressDTO.builder() 
						 .seq(address.seq)
						 .name(address.name)
						 .age(address.age)
						 .address(address.address)
						 .gender(address.gender)
						 .build();
		
	}
	
	public AddressDTO toDTO() {
		
		
		//setter 방식
//		AddressDTO dto = new AddressDTO();
//		dto.setSeq(this.getSeq());
//		dto.setName(this.getName());
//		dto.setAge(this.getAge());
//		dto.setAddress(this.getAddress());
//		dto.setGender(this.getGender());
//		
//		return dto;
		
		//빌더 패턴 방식
		return AddressDTO.builder()
				.seq(this.getSeq())
				.name(this.getName())
				.age(this.getAge())
				.address(this.getAddress())
				.gender(this.getGender())
				.build();
		
	}
	
	//*** JPA의 Entity는 MVC에서 흔히 사용하는 DTO는 역할이 다르다.
	//- DTO > 계층 간의 데이터 전달
	//	- setName() 호출 > 전달할 데이터 추가 or 변경
	//- Entity > DB 조작 
	//	- setName() 호출 > DB 데이터 추가 or 변경
	
	
	//주소 수정 Setter
	public void updateAddress(String address) {
		this.address = address;
	}
	
}
