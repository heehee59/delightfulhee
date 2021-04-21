package com.dh.web.controller.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.dh.web.dto.ResponseDto;
import com.dh.web.model.LevelType;
import com.dh.web.model.User;
import com.dh.web.service.UserService;

@RestController
public class UserApiController {
	
	@Autowired
	private UserService userService;

	@PostMapping("/api/user")
	public ResponseDto<Integer> save(@RequestBody User user) {
		System.out.println("UserApiController : save 호출됨");
		user.setLevel(LevelType.USER);
		int result = userService.join(user);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), result);
	} 
}
