package com.dh.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.dh.web.model.Story;

public interface StoryRepository extends JpaRepository<Story, Integer>{
	
}
