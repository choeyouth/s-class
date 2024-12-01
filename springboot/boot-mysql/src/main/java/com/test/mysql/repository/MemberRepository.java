package com.test.mysql.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.mysql.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Long> {

}
