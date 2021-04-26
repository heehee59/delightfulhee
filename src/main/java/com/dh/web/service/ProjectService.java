package com.dh.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.model.Project;
import com.dh.web.model.User;
import com.dh.web.repository.ProjectRepository;

@Service
public class ProjectService {
	
	@Autowired
	private ProjectRepository projectRepository;

	@Transactional
	public void write(Project board, User user) {
		board.setViewcnt(0);
		board.setUser(user);
		projectRepository.save(board);
	}
	
	@Transactional(readOnly = true)
	public Page<Project> projectList(Pageable pageable) {
		return projectRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public Project projectContent(int id) {
		return projectRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}

	@Transactional
	public void delete(int id) {
		projectRepository.deleteById(id);
	}

	@Transactional
	public void update(int id, Project requestBoard) {
		Project board = projectRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("해당 글을 찾을 수 없습니다.");
				});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
	}

}
