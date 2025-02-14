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


@Entity //데이터베이스의 테이블의 참조 객체, DB의 tblAddress 테이블과 연결된 객체 
@Getter //엔티티에는 세터 구현X, 필요에 따라 Getter 구현 가능 
@ToString
@Table(name = "tblAddress") //진짜 오라클의 테이블 이름 매핑 
@Builder
@NoArgsConstructor //파라미터가 없는 디폴드 생성자를 자동으로 생성한다. 
@AllArgsConstructor //클래스의 모든 필드 값을 파라미터로 받는 생성자를 자동으로 생성한다. 
public class Address {

	// 기본키(PK) 설정 
	@Id 
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "address_seq_generator") //DB 특성에 맞게 시퀀스 값 처리 (MySQL > AUTO, Oracle > SEQUENCE) 
	@SequenceGenerator(name = "address_seq_generator", sequenceName = "seqAddress", allocationSize = 1) //seq.nextVal과 같은 역할을 하기 위함 
	private Long seq;
	
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	public AddressDTO toDTO() {
		
		//1. setter 방식 
//		AddressDTO dto = new AddressDTO();
//		dto.setSeq(seq);
//		dto.setName(name);
//		dto.setAge(age);
//		dto.setAddress(address);
//		dto.setGender(gender);
//		
//		return dto;
		
		
		//2. 빌더 패턴 방식
		
		////public AddressDTO toDTO()
		return AddressDTO.builder()
				.seq(this.getSeq())
				.name(this.getName())
				.age(this.getAge())
				.address(this.getAddress())
				.gender(this.getGender())
				.build();
		
	}
	
	//static 붙임으로써 게터 사용 안 해도 됨 
	//public AddressDTO toDTO() -> 
	public static AddressDTO toDTO(Address address) {
		return AddressDTO.builder() 
						.seq(address.seq)
						.name(address.name)
						.age(address.age)
						.address(address.address)
						.gender(address.gender)
						.build();
	}
	
	//수정 방법 2
	public void updateAddress(String address) {
		this.address = address;
	}
	
	
	
	
}
