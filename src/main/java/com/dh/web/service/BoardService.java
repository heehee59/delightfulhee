package com.dh.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dh.web.model.Board;
import com.dh.web.model.User;
import com.dh.web.repository.BoardRepository;

@Service
public class BoardService {
	
	@Autowired
	private BoardRepository boardRepository;

	@Transactional
	public void write(Board board, User user) {
		board.setViewcnt(0);
		board.setUser(user);
		boardRepository.save(board);
	}

}
