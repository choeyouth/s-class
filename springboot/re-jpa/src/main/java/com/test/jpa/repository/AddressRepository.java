package com.test.jpa.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.jpa.entity.Address;

//DAO 역할 > 데이터베이스 조작(SQL X) > 객체(Address Entity) 조작 
public interface AddressRepository extends JpaRepository<Address, Long> {

	Optional<Address> findById(long l);

	Optional<Address> findByName(String name);

	Optional<Address> findByAddress(String address);

	Optional<Address> findByGender(String gender);

	Address findByAge(int i);

	Address findByNameAndGender(String name, String gender);

	List<Address> findByGenderAndAge(String gender, int age);

	List<Address> findByGenderOrAge(String gender, int age);
	
}
