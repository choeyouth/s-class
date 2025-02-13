package com.test.jpa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.ToString;


@Entity //데이터베이스의 테이블의 참조 객체, DB의 tblAddress 테이블과 연결된 객체 
@ToString
@Table(name = "tblAddress") //진짜 오라클의 테이블 이름 매핑 
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
	
}
