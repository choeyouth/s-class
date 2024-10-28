package com.test.spring.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.test.spring.dto.CustomUser;
import com.test.spring.dto.MemberDTO;
import com.test.spring.mapper.BoardMapper;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private BoardMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//username > DB > select 

		MemberDTO dto = mapper.loadUser(username);

		return dto != null ? new CustomUser(dto) : null; //null > 로그인 실패
	}
}
