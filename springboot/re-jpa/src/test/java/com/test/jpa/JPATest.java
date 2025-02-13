package com.test.jpa;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.test.jpa.entity.Address;
import com.test.jpa.repository.AddressRepository;

@SpringBootTest
public class JPATest {

	@Autowired
	private AddressRepository addressRepository;
	
	@Test
	public void testRepository() {
		
		assertNotNull(addressRepository);
		
		Optional<Address> address = addressRepository.findById(1L);
		
		
	}
	
}
