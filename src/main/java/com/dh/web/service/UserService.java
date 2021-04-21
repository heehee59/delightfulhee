package com.dh.web.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dh.web.model.User;
import com.dh.web.repository.UserRepository;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Transactional
	public int join(User user) {
		try {
			userRepository.save(user);
			return 1;
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("UserService : join() : "+e.getMessage());
		}
		return -1;
	}
}
