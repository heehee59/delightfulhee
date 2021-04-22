package com.dh.web.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.dh.web.model.User;

public interface UserRepository extends JpaRepository<User, Integer>{

	Optional<User> findByUsername(String username);
	
}

/* JPA 네이밍
// == SELECT * FROM user WHERE username = ? AND password = ?;
User findByUsernameAndPassword(String username, String password);

위와 같은 문법
@Query(value = "SELECT * FROM user WHERE username = ? AND password = ?", nativeQuery = true)
User login(String username, String password); */