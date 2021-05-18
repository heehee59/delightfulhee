package com.dh.web.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dh.web.config.auth.PrincipalDetail;
import com.dh.web.dto.ReplySaveRequestDto;
import com.dh.web.dto.ResponseDto;
import com.dh.web.model.GuestBook;
import com.dh.web.service.GuestBookService;

@RestController
public class GuestBookApiController {
	
	@Autowired
	private GuestBookService guestService;

	@PostMapping("/api/guest")
	public ResponseDto<Integer> save(@RequestBody GuestBook board, @AuthenticationPrincipal PrincipalDetail principal) {
		guestService.write(board, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	} 
	
	@DeleteMapping("/api/guest/{boardid}")
	public ResponseDto<Integer> deleteById(@PathVariable int id) {
		guestService.delete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
	
	@PostMapping("/api/guest/{boardid}/reply")
	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto) {
		guestService.writeReply(replySaveRequestDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	/*
	@PutMapping("/api/guest/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Project board) {
		boardService.update(id, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}*/
	
}