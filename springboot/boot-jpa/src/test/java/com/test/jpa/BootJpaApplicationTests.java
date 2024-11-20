package com.test.jpa;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Random;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class BootJpaApplicationTests {
	
	@Autowired
	private Random rnd;

	@Test
	void contextLoads() {
		assertNotNull(rnd);
	}

}










