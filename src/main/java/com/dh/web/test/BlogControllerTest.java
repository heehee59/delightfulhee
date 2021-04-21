package com.dh.web.test;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class BlogControllerTest {
	
	@GetMapping("/test/hello")
	public String hell() {
		return "<h1>hello spring boot</h1>";
	}

}
