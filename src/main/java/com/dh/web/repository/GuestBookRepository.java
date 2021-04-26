package com.dh.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dh.web.model.GuestBook;

public interface GuestBookRepository extends JpaRepository<GuestBook, Integer>{

	
}
