package com.dh.web.config.auth;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.dh.web.model.User;

import lombok.Getter;

// 스프링 시큐리티가 로그인 요청을 가로채서 로그인을 진행하고 완료가 되면
// UserDetails 타입의 오브젝트를 스프링 시큐리티의 고유한 세션 저장소에 저장해준다.
@Getter
public class PrincipalDetail implements UserDetails {
	
	private User user;
	
	public PrincipalDetail(User user) {
		this.user = user;
	}

	@Override
	public String getPassword() {
		return user.getPassword();
	}

	@Override
	public String getUsername() {
		return user.getUsername();
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true; // true : 계정 만료 x
	}

	@Override
	public boolean isAccountNonLocked() {
		return true; // true : 계정 락 x
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true; // true : 비밀번호 만료 x
	}

	@Override
	public boolean isEnabled() {
		return true; // true : 계정 활성화 o
	}

	@Override // 계정이 갖고 있는 권한 목록을 리턴
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collectors = new ArrayList<>();
		collectors.add(()->{return "LEVEL_"+user.getLevel();});
		return collectors;
	}

}
