package com.dh.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.dh.web.model.StoryReply;

public interface StoryReplyRepository extends JpaRepository<StoryReply, Integer>{

	@Modifying
	@Query(value="INSERT INTO storyreply(userid, storyid, content, date) VALUES (?1, ?2, ?3, now())", nativeQuery=true)
	int mSave(int userid, int storyid, String content);
	
}
