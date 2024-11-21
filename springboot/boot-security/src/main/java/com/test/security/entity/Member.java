package com.test.security.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Getter
@ToString
@Builder
//@Table(name="tblMemeber") //필요X, 오라클 > member로 되어 있기 때문에...
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "member_seq_generator") //DB 특성에 맞게 시퀀스 값 처리(MySql > AUTO, oracle > SEQUENCE)
	@SequenceGenerator(name="member_seq_generator", sequenceName = "seqMember", allocationSize = 1) //seq.nextVal과 같은 역할을 하기 위함
	private Long seq;
	
	@Column(unique=true, nullable=false)
	private String username;
	
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=false)
	private String role;
	
}
