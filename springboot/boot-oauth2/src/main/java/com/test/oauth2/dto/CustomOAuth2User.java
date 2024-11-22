package com.test.oauth2.dto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

//CustomOAuth2User > 인증 객체
//네이버 로그인 성공 > NaverResponse(저장) > 변환 > CustomOAuth2User(저장) + UserDTO
public class CustomOAuth2User implements OAuth2User {

	private final UserDTO userDTO;
	
	//최종 인증 객체 
	public CustomOAuth2User(UserDTO userDTO) {
		this.userDTO = userDTO;
	}
	
	@Override
	public Map<String, Object> getAttributes() {
		//Provider > 정보 
		return Map.of(); //null(X), 아무것도 들어있지 않은 값 반환
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
       
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        authorities.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return userDTO.getRole();
            }
        });

        return authorities;	
	}

	@Override
	public String getName() {

		return userDTO.getName();
	}
	
	//추가 정보 
	public String getUsername() {
		
		return userDTO.getUsername();
	}

}
