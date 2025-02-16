package com.test.jpa.config;

/* 

QueryDSL(Domain Specific Language)
- JPQL 작성을 도와주는 동적 쿼리 빌더(오픈 소스 라이브러리)

JPQL을 직접 작성하지 않고 QueryDSL을 사용하는 이유?
- JPQL은 문자열로 질의를 작성

QClass 생성
- 엔티티 클래스에 대응하는 정적 클래스 > QClass로부터 질의에 사용하는 여러 메서드를 제공 받는다 

QueryDSL 설정
- 스프링 빈 설정
-> root-context, servlet.xml(X)
=> 자바 방식으로 빈 설정

*/


import java.util.Random;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.querydsl.jpa.impl.JPAQueryFactory;

import jakarta.persistence.EntityManager;
import lombok.RequiredArgsConstructor;

//root-context.xml 같은 설정 파일 역할 클래스
@Configuration
@RequiredArgsConstructor
public class QueryDSLConfig {
	
	//JPA에서 SQL을 실행하는 객체 > Statement 객체, SqlSessionTemplate 객체
	private final EntityManager em; 

	//<bean class="JPAQueryFactory">
	@Bean
	public JPAQueryFactory jPAQueryFactory() {
		return new JPAQueryFactory(em);
	}
	
	//<bean class="java.util.Random"></bean>
	@Bean
	public Random random() {
		return new Random();
	}
	
}


















