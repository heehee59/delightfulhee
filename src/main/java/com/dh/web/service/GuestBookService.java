package com.dh.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.dto.ReplySaveRequestDto;
import com.dh.web.model.GuestBook;
import com.dh.web.model.User;
import com.dh.web.repository.GuestBookReplyRepository;
import com.dh.web.repository.GuestBookRepository;

@Service
public class GuestBookService {
	
	@Autowired
	private GuestBookRepository guestRepository;
	
	@Autowired
	private GuestBookReplyRepository guestBookReplyRepository;

	@Transactional
	public void write(GuestBook board, User user) {
		board.setUser(user);
		guestRepository.save(board);
	}
	
	@Transactional(readOnly = true)
	public Page<GuestBook> guestbookList(Pageable pageable) {
		return guestRepository.findAll(pageable);
	}

	@Transactional
	public void delete(int id) {
		guestRepository.deleteById(id);
	}
	
	@Transactional
	public void writeReply(ReplySaveRequestDto replySaveRequestDto) {
		guestBookReplyRepository.mSave(replySaveRequestDto.getUserid(), replySaveRequestDto.getBoardid(), replySaveRequestDto.getContent());
	}

	/*
	@Transactional
	public void update(int id, GuestBook requestBoard) {
		GuestBook board = guestRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("해당 글을 찾을 수 없습니다.");
				});
		board.setContent(requestBoard.getContent());
	}*/

}
