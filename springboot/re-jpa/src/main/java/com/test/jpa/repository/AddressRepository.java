package com.test.jpa.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.test.jpa.dto.AddressDTO;
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

	//방법1. 별칭 필수
	//@Query("select a.name from Address as a")
	//방법2. 기존 쿼리 그대로 작성하는 방법
	@Query(value="select name from tblAddress", nativeQuery = true)
	List<String> listName();

	@Query("select a from Address as a")
	List<String> listAll();
	
	@Query("select a from Address as a where a.gender = ?1")
	List<String> listAll(String gender);

	@Query("select a from Address as a where a.age >= :age")
	List<String> listAll(@Param(value="age") int age);

	@Query("select a from Address as a where a.gender = :#{#dto.gender} and a.address like '%' || :#{#dto.address} || '%'") //dto.getGender == :#{#dto.gender}
	List<String> listAll(@Param(value="dto") AddressDTO dto);

	@Query("select new com.test.jpa.dto.AddressDTO(a.seq, a.name, a.age, a.address, a.gender, year(current_date) - a.age) from Address as a")
	List<AddressDTO> listCustomAll();
	
}
