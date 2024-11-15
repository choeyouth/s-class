package com.test.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.jpa.entity.Address;

//DAO 역할 > 데이터베이스 조작(SQL X) > 객체(Address Entity) 조작 
//- JpaRepository<취급할 엔티티, 엔티티의 @Id 기본키 자료형>
public interface AddressRepository extends JpaRepository<Address, Long>{

}
