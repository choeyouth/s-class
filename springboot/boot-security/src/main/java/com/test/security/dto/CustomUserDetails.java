package com.test.security.dto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.test.security.entity.Member;

import lombok.Getter;

//인증 사용자 정보 객체 > principal
@Getter
public class CustomUserDetails implements UserDetails {

	//사용자 추가 정보 저장용
	//- 이전 수업(UserDTO)
	//- 현재 수업(Memer Entity)
	private Member member;
	
	public CustomUserDetails(Member member) {
		this.member = member;
	}
	
	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();

        authorities.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return member.getRole();
            }
        });

        return authorities;
    }

	@Override
	public String getPassword() {
		
		return member.getPassword();
	}

	@Override
	public String getUsername() {

		return member.getUsername();
	}

	@Override
	public boolean isAccountNonExpired() {
		
		//현재 계정이 만료된 계정? 활동 중인 계정?
		//DB > 컬럼 존재(active)
		//계정 만료 유무?
		return true; //DB 없은께 true
	}

	@Override
	public boolean isAccountNonLocked() {

		//계정 잠금 상태 
		return true; //DB 없은께 true
	}

	@Override
	public boolean isCredentialsNonExpired() {

		//자격 증명(암호) 만료 상태
		return true; //DB 없은께 true
	}

	@Override
	public boolean isEnabled() {

		//사용 유무
		return true; 
	}
}
