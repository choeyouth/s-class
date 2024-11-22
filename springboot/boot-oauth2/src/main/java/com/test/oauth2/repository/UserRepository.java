package com.test.oauth2.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.oauth2.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long> {

	UserEntity findByUsername(String username);

}
