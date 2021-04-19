package com.dh.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.dh.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	
	
}
