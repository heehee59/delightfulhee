package com.dh.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.dto.ReplySaveRequestDto;
import com.dh.web.model.Story;
import com.dh.web.model.StoryReply;
import com.dh.web.model.User;
import com.dh.web.repository.StoryReplyRepository;
import com.dh.web.repository.StoryRepository;
import com.dh.web.repository.UserRepository;

@Service
public class StoryService {
	
	@Autowired
	private StoryRepository storyRepository;
	
	@Autowired
	private StoryReplyRepository storyReplyRepository;

	@Transactional
	public void write(Story board, User user) {
		board.setViewcnt(0);
		board.setUser(user);
		storyRepository.save(board);
	}
	
	@Transactional(readOnly = true)
	public Page<Story> storyList(Pageable pageable) {
		return storyRepository.findAll(pageable);
	}
	
	@Transactional(readOnly = true)
	public Story storyContent(int id) {
		return storyRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}

	@Transactional
	public void delete(int id) {
		storyRepository.deleteById(id);
	}

	@Transactional
	public void update(int id, Story requestBoard) {
		Story board = storyRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("해당 글을 찾을 수 없습니다.");
				});
		board.setTitle(requestBoard.getTitle());
		board.setContent(requestBoard.getContent());
	}

	@Transactional
	public void writeReply(ReplySaveRequestDto replySaveRequestDto) {
		storyReplyRepository.mSave(replySaveRequestDto.getUserid(), replySaveRequestDto.getBoardid(), replySaveRequestDto.getContent());
	}

	@Transactional
	public void deleteReply(int replyid) {
		storyReplyRepository.deleteById(replyid);
	}

}
