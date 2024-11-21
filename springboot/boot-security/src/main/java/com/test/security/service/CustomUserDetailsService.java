package com.test.security.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.test.security.dto.CustomUserDetails;
import com.test.security.entity.Member;
import com.test.security.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
	
	//로그인 처리 > DB 사용
	private final MemberRepository memberRepository;
	
	//사용자 > 로그인 시도(username, password) > loadUserByUsername 호출
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		//select * from member where username = ?
		Member member = memberRepository.findByUsername(username);
		
		if (member != null) {
			return new CustomUserDetails(member); //로그인 성공
		}
		
		return null; //로그인 실패
	}
}
