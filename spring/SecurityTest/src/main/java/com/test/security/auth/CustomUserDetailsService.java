package com.test.security.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.test.security.dto.CustomUser;
import com.test.security.dto.MemberDTO;
import com.test.security.mapper.SecurityMapper;

public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private SecurityMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		//username > DB > select 

		MemberDTO dto = mapper.loadUser(username);

		return dto != null ? new CustomUser(dto) : null; //null > 로그인 실패
	}

}
