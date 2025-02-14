package com.test.jpa.dto;

import com.test.jpa.entity.Address;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class AddressDTO {

	private Long seq;
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	public static Address toEntity(AddressDTO dto) {
		
		return Address.builder()
				.seq(dto.getSeq())
				.name(dto.getName())
				.address(dto.getAddress())
				.gender(dto.getGender())
				.age(dto.getAge())
				.build();
	}
	
	public Address toEntity() {
		
		return Address.builder()
				.seq(this.getSeq())
				.name(this.getName())
				.address(this.getAddress())
				.age(this.getAge())
				.gender(this.getGender())
				.build();
	}
}
