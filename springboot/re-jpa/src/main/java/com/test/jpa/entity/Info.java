package com.test.jpa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString; 

@Entity
@Getter
@ToString
@Table(name="tblInfo")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Info {

	@Id
	private Long seq;
	
	private String school;
	private String country;
	
	//자식이 부모를 참조하는 경우
	@OneToOne // > 1:1 관계 
	@JoinColumn(name = "seq")
	private Address address;
	
}
