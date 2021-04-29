package com.dh.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.dh.web.model.ProjectReply;

public interface ProjectReplyRepository extends JpaRepository<ProjectReply, Integer>{

	@Modifying
	@Query(value="INSERT INTO projectreply(userid, projectid, content, date) VALUES (?1, ?2, ?3, now())", nativeQuery=true)
	int mSave(int userid, int projectid, String content);
	
}
