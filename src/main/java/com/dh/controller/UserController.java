package com.dh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/user/join")
	public String joinForm() {
		return "user/join";
	}
	
	@GetMapping("/user/login")
	public String loginForm() {
		return "user/login";
	}

}
