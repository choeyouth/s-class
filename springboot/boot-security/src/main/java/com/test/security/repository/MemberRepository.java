package com.test.security.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.security.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {//Entity, Primary Type

	boolean existsByUsername(String username);

	Member findByUsername(String username); 

}
