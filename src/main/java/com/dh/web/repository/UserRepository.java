package com.dh.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dh.web.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	
	
}
