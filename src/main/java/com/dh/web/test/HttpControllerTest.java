package com.dh.web.test;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// 사용자가 요청 -> Html을 응답하는 컨트롤러는 @Controller
@RestController	// 사용자가 요청 -> 데이터를 응답해주는 컨트롤러
public class HttpControllerTest {
	
	private static final String TAG = "HttpControllerTest";
	
	@GetMapping("/http/lombok")
	public String lombokTest() {
		Member m = Member.builder().username("ssar").password("1234").email("abc@abc.com").build();
		System.out.println(TAG+"getter : "+m.getId());
		m.setId(5000);
		System.out.println(TAG+"getter : "+m.getId());
		return "lombok test 완료";
	}
	// http://localhost:8082/http/get (select)
	@GetMapping("/http/get")
	public String getTest(Member m) {
		return "get 요청 : "+m.getId()+", "+m.getUsername();
	}
	
	// http://localhost:8082/http/post (insert)
	@PostMapping("/http/post")
	public String postTest() {
		return "post 요청";
	}
	
	// http://localhost:8082/http/put (update)
	@PutMapping("/http/put")
	public String putTest() {
		return "put 요청";
	}
	
	// http://localhost:8082/http/delete (delete)
	@DeleteMapping("/http/delete")
	public String deleteTest() {
		return "delete 요청";
	}

}
