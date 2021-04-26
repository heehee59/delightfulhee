package com.dh.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dh.web.model.Project;

public interface ProjectRepository extends JpaRepository<Project, Integer>{

	
}
