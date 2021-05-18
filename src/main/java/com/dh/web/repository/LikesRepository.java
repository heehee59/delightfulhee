package com.dh.web.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.model.Likes;

@Transactional(readOnly=true)
public interface LikesRepository extends JpaRepository<Likes, Integer> {
	
	public List<Likes> findByProjectId(int proejctid);
	@Modifying
	@Transactional
	@Query(value="DELETE FROM likes WHERE projectid = ?1 AND userid= ?2", nativeQuery=true)
	public void deleteLikeForProject(int projectid, int userid);
	

}
