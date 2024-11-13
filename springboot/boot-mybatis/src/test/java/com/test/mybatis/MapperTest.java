package com.test.mybatis;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.test.mybatis.mapper.AddressMapper;

@SpringBootTest
public class MapperTest {

	@Autowired
	private AddressMapper mapper;
	
	@Test
	public void testTime() {
		
		assertNotNull(mapper);
		
		System.out.println(mapper.time());
		
	}
	
}
