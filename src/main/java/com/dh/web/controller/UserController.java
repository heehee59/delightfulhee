package com.dh.web.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.dh.web.config.auth.PrincipalDetail;

@Controller
public class UserController {
	
	@Value("${cos.key}")
	private String cosKey;
	
	
	@GetMapping("/auth/joinForm")
	public String joinForm() {
		return "user/joinForm";
	}
	
	@GetMapping("/auth/loginForm")
	public String loginForm() {
		return "user/loginForm";
	}
	
	@GetMapping("/mypage")
	public String mypage(@AuthenticationPrincipal PrincipalDetail principal) {
		return "user/mypage";
	}

}
