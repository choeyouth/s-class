package com.test.jpa.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.test.jpa.entity.Address;
import com.test.jpa.entity.AddressNameAgeMapping;

//DAO 역할 > 데이터베이스 조작(SQL X) > 객체(Address Entity) 조작 
//- JpaRepository<취급할 엔티티, 엔티티의 @Id 기본키 자료형>
public interface AddressRepository extends JpaRepository<Address, Long>{

	Optional<Address> findByName(String name);

	Optional<Address> findByAddress(String address);

	Optional<Address> findByGender(String gender);

	Address findFirstByAge(int age);

	Address findByNameAndGender(String name, String gender);

	List<Address> findByGenderAndAge(String gender, int age);

	List<Address> findByGenderOrAge(String gender, int age);

	List<Address> findByGenderOrAgeOrName(String gender, int age, String name);

	List<Address> findByAgeGreaterThan(int age);

	List<Address> findByAgeLessThan(int age);

	List<Address> findByAgeLessThanEqual(int age);

	List<Address> findByAgeBetween(int min, int max);

	List<Address> findByAddressIsNull();

	List<Address> findByAddressIsNotNull();

	List<Address> findByAgeIn(List<Integer> age);

	List<Address> findByAgeNotIn(List<Integer> age);

	List<Address> findByAddressStartingWith(String address);

	List<Address> findByAddressStartsWith(String address);

	List<Address> findByAddressEndingWith(String address);

	List<Address> findByAddressContains(String address);

	List<Address> findByAddressLike(String address);

	List<Address> findByAddressNotLike(String address);

	Optional<Address> findByNameIs(String string);

	Optional<Address> findByNameEquals(String string);

	List<Address> findAllByOrderByNameAsc();

	List<Address> findByGenderOrderByNameAsc(String gender);

	List<Address> findByGenderOrderByNameDesc(String gender);

	List<Address> findByGenderOrderByAgeAscNameDesc(String gender);

	List<Address> findByGenderAndAgeOrderByAgeAscNameDesc(String gender, int age);

	List<Address> findByGender(String gender, Sort age);

	List<Address> findByGender(Sort age, String gender);

	List<AddressNameAgeMapping> findAllByGender(String gender);
	
}
