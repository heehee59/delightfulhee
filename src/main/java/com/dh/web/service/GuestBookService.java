package com.dh.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.model.GuestBook;
import com.dh.web.model.User;
import com.dh.web.repository.GuestBookRepository;

@Service
public class GuestBookService {
	
	@Autowired
	private GuestBookRepository guestRepository;
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
	
	@Transactional(readOnly = true)
	public GuestBook guestbookContent(int id) {
		return guestRepository.findById(id)
				.orElseThrow(()->{
					return new IllegalArgumentException("글 상세보기 실패 : 아이디를 찾을 수 없습니다.");
				});
	}

}
