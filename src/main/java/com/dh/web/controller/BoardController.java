package com.dh.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dh.web.model.GuestBook;
import com.dh.web.model.Project;
import com.dh.web.model.Story;
import com.dh.web.service.GuestBookService;
import com.dh.web.service.ProjectService;
import com.dh.web.service.StoryService;
import com.google.gson.JsonObject;

@Controller
public class BoardController {
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private GuestBookService guestService;
	
	@Autowired
	private StoryService storyService;
	
	// index
	@GetMapping({"","/"})
	public String index() {
		return "index";
	}
	
	// about 페이지 화면 요청
	@GetMapping("/auth/about")
	public String about() {
		return "board/about";
	}
	
	// project 목록 불러오기
	@GetMapping("/auth/project")
	public String project(@PageableDefault(size=6, sort="id", direction=Sort.Direction.DESC) Pageable pageable, Model model) {
		Page<Project> list = projectService.projectList(pageable);
		int nowPage = list.getPageable().getPageNumber();	// 현재 페이지
		int totalPages = list.getTotalPages();	// 총 페이지 수
		int pageBtn = 5;	// 표시 될 페이지 버튼 수
		int firstPage = (nowPage/pageBtn)*pageBtn+1;
		int lastPage = firstPage+pageBtn-1;
		lastPage = totalPages < lastPage ? totalPages : lastPage;
		model.addAttribute("boards", list);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		return "board/project/project";
	}
	
	// project 글쓰기 화면 요청
	@GetMapping("/auth/project/write")
	public String projectWriteForm() {
		return "board/project/project_writeForm";
	}
	
	// project 글쓰기 - 파일 업로드
	@PostMapping(value="/uploadSummernoteImageFile", produces="appliaction/json")
	@ResponseBody
	public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		JsonObject jsonObject = new JsonObject();
		
		String fileRoot = "D:\\summernote_image\\";
		String originalFileName = multipartFile.getOriginalFilename();
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
		
		String savedFileName = UUID.randomUUID()+extension;
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);
			jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
			jsonObject.addProperty("responseCode", "success");
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	// project 글 상세보기 화면 요청
	@GetMapping("/auth/project/{id}")
	public String projectFindById(@PathVariable int id, Model model, @PageableDefault(size=6, sort="id", direction=Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("board", projectService.projectContent(id));

		// 목록 출력을 위한 코드
		Page<Project> list = projectService.projectList(pageable);
		int nowPage = list.getPageable().getPageNumber();	// 현재 페이지
		int totalPages = list.getTotalPages();	// 총 페이지 수
		int pageBtn = 5;	// 표시 될 페이지 버튼 수
		int firstPage = (nowPage/pageBtn)*pageBtn+1;
		int lastPage = firstPage+pageBtn-1;
		lastPage = totalPages < lastPage ? totalPages : lastPage;
		model.addAttribute("boards", list);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		return "board/project/project_detail";
	}
	
	// project 글 수정 화면 요청
	@GetMapping("/auth/project/{id}/modify")
	public String projectModifyForm(@PathVariable int id, Model model) {
		model.addAttribute("board", projectService.projectContent(id));
		return "board/project/project_modifyForm";
	}
	
	// devel-story 목록 불러오기
	@GetMapping("/auth/develstory")
	public String delvelstory(@PageableDefault(size=10, sort="id", direction=Sort.Direction.DESC) Pageable pageable, Model model) {
		Page<Story> list = storyService.storyList(pageable);
		int nowPage = list.getPageable().getPageNumber();	// 현재 페이지
		int totalPages = list.getTotalPages();	// 총 페이지 수
		int pageBtn = 5;	// 표시 될 페이지 버튼 수
		int firstPage = (nowPage/pageBtn)*pageBtn+1;
		int lastPage = firstPage+pageBtn-1;
		lastPage = totalPages < lastPage ? totalPages : lastPage;
		model.addAttribute("boards", list);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		return "board/story/develstory";
	}
	
	// devel-story 글쓰기 화면 요청
	@GetMapping("/auth/develstory/write")
	public String storyWriteForm() {
		return "board/story/develstory_writeForm";
	}
	
	// devel-story 글 상세보기 화면 요청
	@GetMapping("/auth/develstory/{id}")
	public String storyFindById(@PathVariable int id, Model model, @PageableDefault(size=10, sort="id", direction=Sort.Direction.DESC) Pageable pageable) {
		model.addAttribute("board", storyService.storyContent(id));
		
		// 목록 출력을 위한 코드
		Page<Story> list = storyService.storyList(pageable);
		int nowPage = list.getPageable().getPageNumber();	// 현재 페이지
		int totalPages = list.getTotalPages();	// 총 페이지 수
		int pageBtn = 5;	// 표시 될 페이지 버튼 수
		int firstPage = (nowPage/pageBtn)*pageBtn+1;
		int lastPage = firstPage+pageBtn-1;
		lastPage = totalPages < lastPage ? totalPages : lastPage;
		model.addAttribute("boards", list);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		return "board/story/develstory_detail";
	}
	
	// devel-story 글 수정 화면 요청
	@GetMapping("/auth/develstory/{id}/modify")
	public String storyModifyForm(@PathVariable int id, Model model) {
		model.addAttribute("board", storyService.storyContent(id));
		return "board/story/develstory_modifyForm";
	}
	
	// guestbook 화면 요청
	@GetMapping("/guestbook")
	public String guestbook(@PageableDefault(size=3, sort="id", direction=Sort.Direction.DESC) Pageable pageable, Model model) {
		Page<GuestBook> list = guestService.guestbookList(pageable);
		int nowPage = list.getPageable().getPageNumber();	// 현재 페이지
		int totalPages = list.getTotalPages();	// 총 페이지 수
		int pageBtn = 5;	// 표시 될 페이지 버튼 수
		int firstPage = (nowPage/pageBtn)*pageBtn+1;
		int lastPage = firstPage+pageBtn-1;
		lastPage = totalPages < lastPage ? totalPages : lastPage;
		model.addAttribute("boards", list);
		model.addAttribute("firstPage", firstPage);
		model.addAttribute("lastPage", lastPage);
		return "board/guest/guestbook";
	}
	
	// 개인정보처리방침 페이지 화면 요청
	@GetMapping("/auth/policy")
	public String policy() {
		return "board/policy";
	}
}
