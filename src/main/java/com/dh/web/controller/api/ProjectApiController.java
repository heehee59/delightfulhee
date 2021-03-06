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
import com.dh.web.model.Project;
import com.dh.web.service.ProjectService;

@RestController
public class ProjectApiController {
	
	@Autowired
	private ProjectService boardService;

	@PostMapping("/api/project")
	public ResponseDto<Integer> save(@RequestBody Project board, @AuthenticationPrincipal PrincipalDetail principal) {
		boardService.write(board, principal.getUser());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/project/{id}")
	public ResponseDto<Integer> deleteById(@PathVariable int id) {
		boardService.delete(id);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
	
	@PutMapping("/api/project/{id}")
	public ResponseDto<Integer> update(@PathVariable int id, @RequestBody Project board) {
		boardService.update(id, board);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	@PostMapping("/api/project/{boardid}/reply")
	public ResponseDto<Integer> replySave(@RequestBody ReplySaveRequestDto replySaveRequestDto) {
		boardService.writeReply(replySaveRequestDto);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@DeleteMapping("/api/project/{boardid}/reply/{replyid}")
	public ResponseDto<Integer> replyDelete(@PathVariable int replyid) {
		boardService.deleteReply(replyid);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1); 
	}
}