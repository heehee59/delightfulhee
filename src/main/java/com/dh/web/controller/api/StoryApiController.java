package com.dh.web.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dh.web.config.auth.PrincipalDetail;
import com.dh.web.dto.ReplySaveRequestDto;
import com.dh.web.dto.ResponseDto;
import com.dh.web.model.Story;
import com.dh.web.service.StoryService;

@RestController
public class StoryApiController {
	
	@Autowired
	private StoryService storyService;

	@PostMapping("/api/develstory")
	public ResponseDto<Integer> save(@RequestBody Story board, @AuthenticationPrincipal PrincipalDetail principal) {
		storyService.write(board, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/develstory/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id) {
		storyService.delete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
	
	@PutMapping("/api/develstory/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Story board) {
		storyService.update(id, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/develstory/{boardid}/reply")
	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto) {
		storyService.writeReply(replySaveRequestDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/develstory/{boardid}/reply/{replyid}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyid) {
		storyService.deleteReply(replyid);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
}