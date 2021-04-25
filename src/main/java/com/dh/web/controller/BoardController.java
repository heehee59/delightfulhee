package com.dh.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.dh.web.model.Board;
import com.dh.web.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	//@AuthenticationPrincipal PrincipalDetail principal
	// index
	@GetMapping({"","/"})
	public String index() {
		return "index";
	}
	
	// about
	@GetMapping("/auth/about")
	public String about() {
		return "board/about";
	}
	
	// project 목록 불러오기
	@GetMapping("/auth/project")
	public String project(@PageableDefault(size=6, sort="id", direction=Sort.Direction.DESC) Pageable pageable, Model model) {
	Page<Board> list = boardService.projectList(pageable);
		int nowPage = list.getPageable().getPageNumber();	// 현재 페이지
		int totalPages = list.getTotalPages();	// 총 페이지 수
		int pageBtn = 5;	// 표시 될 페이지 버튼 수
		int firstPage = (nowPage/pageBtn)*pageBtn+1;
		int lastPage = firstPage+pageBtn-1;
		lastPage = totalPages < lastPage ? totalPages : lastPage;
		model.addAttribute("boards", list);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		return "board/project";
	}
	
	// project 글쓰기 화면 요청
	@GetMapping("/project/write")
	public String projectWriteForm() {
		return "board/project_writeForm";
	}
	
	// project 글 상세보기 화면 요청
	@GetMapping("/project/{id}")
	public String findById(@PathVariable int id, Model model) {
		model.addAttribute("board", boardService.projectContent(id));
		return "board/project_detail";
	}
	
	// project 글 수정 화면 요청
	@GetMapping("/project/modify/{id}")
	public String projectModifyForm(@PathVariable int id) {
		
		return "board/project_modifyForm";
	}
	
	@GetMapping("/auth/develstory")
	public String delvelstory() {
		return "board/develstory";
	}
	
	@GetMapping("/auth/guestbook")
	public String guestbook() {
		return "board/guestbook";
	}
}
