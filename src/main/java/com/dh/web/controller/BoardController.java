package com.dh.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	//@AuthenticationPrincipal PrincipalDetail principal
	@GetMapping({"","/"})
	public String index() {
		return "index";
	}
	
	@GetMapping("/about")
	public String about() {
		return "board/about";
	}
	
	@GetMapping("/project")
	public String project() {
		return "board/project";
	}
	
	@GetMapping("/projectwrite")
	public String projectWriteForm() {
		return "board/project_writeForm";
	}
	
	@GetMapping("/develstory")
	public String delvelstory() {
		return "board/develstory";
	}
	
	@GetMapping("/guestbook")
	public String guestbook() {
		return "board/guestbook";
	}
}
