package com.dh.web.config.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.dh.web.model.User;
import com.dh.web.repository.UserRepository;

@Service
public class PrincipalDetailService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;

	@Override // 스프링이 로그인 요청을 가로챌 때, 가지고 오는 username이 DB에 있는지 확인
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User principal = userRepository.findByUsername(username);
		return new PrincipalDetail(principal); // 시큐리티 세션에 유저 정보가 저장됨
	}

}
