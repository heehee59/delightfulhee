package com.dh.web.controller.api;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.dh.web.config.auth.PrincipalDetail;
import com.dh.web.dto.ResponseDto;
import com.dh.web.model.Likes;
import com.dh.web.model.Project;
import com.dh.web.repository.LikesRepository;
import com.dh.web.repository.ProjectRepository;

@RestController
public class LikesApiController {
	
	@Autowired
	private LikesRepository likesRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	
	@PostMapping("/project/{id}/like")
	public ResponseDto<Integer> likeForProjct(@PathVariable int id, 
											@AuthenticationPrincipal PrincipalDetail principal) {
		Optional<Project> projectO = projectRepository.findById(id);
		Project project = projectO.get();
		Likes like = new Likes();
		
		like.setProject(project);
		like.setUser(principal.getUser());
		likesRepository.save(like);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	@PostMapping("/project/{id}/unlike")
	public ResponseDto<Integer> unlikeForProject(@PathVariable int id, 
											@AuthenticationPrincipal PrincipalDetail principal) {
		likesRepository.deleteLikeForProject(id, principal.getUser().getId());
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}


}
