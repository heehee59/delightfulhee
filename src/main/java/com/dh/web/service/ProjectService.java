package com.dh.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.dto.ReplySaveRequestDto;
import com.dh.web.model.Project;
import com.dh.web.model.ProjectReply;
import com.dh.web.model.User;
import com.dh.web.repository.ProjectReplyRepository;
import com.dh.web.repository.ProjectRepository;
import com.dh.web.repository.UserRepository;

@Service
public class ProjectService {
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private ProjectReplyRepository projectReplyRepository;
	
	@Autowired
	private UserRepository userRepository;

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

	@Transactional
	public void writeReply(ReplySaveRequestDto replySaveRequestDto) {
		User user = userRepository.findById(replySaveRequestDto.getUserid())
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글 작성 실패 : 사용자를 찾을 수 없습니다.");
				});
		
		Project board = projectRepository.findById(replySaveRequestDto.getBoardid())
				.orElseThrow(()->{
					return new IllegalArgumentException("댓글 작성 실패 : 게시글 id를 찾을 수 없습니다.");
				});
		
		ProjectReply reply = ProjectReply.builder()
				.user(user)
				.board(board)
				.content(replySaveRequestDto.getContent())
				.build();
		
		projectReplyRepository.save(reply);
	}

	@Transactional
	public void deleteReply(int replyid) {
		projectReplyRepository.deleteById(replyid);
	}

}
