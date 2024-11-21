package com.test.security.service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.test.security.dto.MemberDTO;
import com.test.security.entity.Member;
import com.test.security.repository.MemberRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {

	private final MemberRepository memberRepository;
	private final BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public void join(MemberDTO dto) {
		
		//아이디 중복검사
		boolean result = memberRepository.existsByUsername(dto.getUsername());
		if (result) {
			System.out.println("이미 사용중인 아이디");
			return;
		}
		
		//DTO > (변환) > Entity
		Member member = Member.builder()
							.username(dto.getUsername())
							.password(bCryptPasswordEncoder.encode(dto.getPassword())) //암호를 암호화
							.role(dto.getRole())
							.build();
		
		memberRepository.save(member);
	} 
	
}
