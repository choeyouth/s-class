package com.test.jpa.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.jpa.entity.Address;

//DAO 역할 > 데이터베이스 조작(SQL X) > 객체(Address Entity) 조작 
public interface AddressRepository extends JpaRepository<Address, Long> {

	Optional<Address> findById(long l);
	
}
