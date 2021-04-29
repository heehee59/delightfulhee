package com.dh.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.model.LevelType;
import com.dh.web.model.User;
import com.dh.web.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	@Transactional(readOnly = true)
	public User findUser(String username) {
		User user = userRepository.findByUsername(username).orElseGet(()->{
			return new User();
		});
		return user;
	}

	@Transactional
	public void join(User user) {
		String rawPassword = user.getPassword();
		String encPassword = encoder.encode(rawPassword);
		user.setPassword(encPassword);
		user.setLevel(LevelType.USER);
		userRepository.save(user);
	}

	@Transactional
	public void update(User user) {
		User persistance = userRepository.findById(user.getId()).orElseThrow(()->{
			return new IllegalArgumentException("해당 회원을 찾을 수 없습니다.");
		});
		
		// oauth 체크해서 소셜 로그인 사용자는 비밀번호 수정 로직을 타지 못하게 함
		if(persistance.getOauth() == null || persistance.getOauth().equals("")) {			
			String rawPassword = user.getPassword();
			String encPassword = encoder.encode(rawPassword);
			persistance.setPassword(encPassword);
		}
		persistance.setNickname(user.getNickname());
		persistance.setEmail(user.getEmail());
	}
	
	@Transactional
	public void delete(int id) {
		userRepository.deleteById(id);
	}
	
}