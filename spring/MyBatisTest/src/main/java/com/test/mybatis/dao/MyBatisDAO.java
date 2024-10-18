package com.test.mybatis.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.mybatis.dto.AddressDTO;

@Repository
public class MyBatisDAO {

	//Connection > Statement 
	//SqlSessionTemplate
	
	//DAO > (의존) > SqlSessionTemplate
	@Autowired
	private SqlSessionTemplate template;

	public void m1() {
		
		/*
		
			JDBC Statement
			
			1. executeUpdate()
			    - template.insert()
			    - template.update()
			    - template.delete()
			    - 같은 기능의 메서드를 가독성(구분)을 위해 세 개로 나눔
			
			2. executeQuery()
			    - template.selectOne() > 결과셋의 레코드가 1줄
			    - template.selectList() > 결과셋의 레코드가 N줄		
		
		*/
		
		template.insert("mybatis.m1");
		
	}

	public int m2(String seq) {

		return template.delete("mybatis.m2", seq); //오버로딩 
			
	}

	public int m3(AddressDTO dto) {
		
		return template.update("mybatis.m3", dto);

	}
	
	
}
