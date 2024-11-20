package com.test.jpa.config;

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

