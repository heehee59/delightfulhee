package com.dh.web.config.oauth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.dh.web.config.auth.PrincipalDetail;
import com.dh.web.model.User;
import com.dh.web.repository.UserRepository;

@Service
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		System.out.println("getClientRegistration : "+userRequest.getClientRegistration()); // registrationId로 어떤 OAuth로 로그인했는지 확인 가능
		System.out.println("getAccessToken : "+userRequest.getAccessToken());
		
		OAuth2User oauth2User = super.loadUser(userRequest);
		/* 프로세스
		 * 구글 로그인 버튼 클릭 -> 구글 로그인 창 -> 로그인 완료 -> CODE 리턴 (OAuth-Client라이브러리)
		 * -> 액새스 토큰 요청 -> userRequest정보 -> loadUser함수 호출 -> 구글로부터 프로필 가져오기 완료
		 */
		System.out.println("getAttribute : "+super.loadUser(userRequest).getAttributes());
		
		String provider = userRequest.getClientRegistration().getClientId();
		String providerId = oauth2User.getAttribute("sub");
		String username = provider+"_"+providerId;
		String password = bCryptPasswordEncoder.encode("겟인데어");
		String nickname = oauth2User.getAttribute("name");
		String profileImg = oauth2User.getAttribute("picture");
		String email = oauth2User.getAttribute("email");
		
		User userEntity = userRepository.findByUsername(username);
		
		if(userEntity == null) {
			userEntity = User.builder()
					.username(username)
					.password(password)
					.email(email)
					.nickname(nickname)
					.email(email)
					.profileImg(profileImg)
					.provider(provider)
					.providerId(providerId)
					.build();
			userRepository.save(userEntity);
		}
		
		return new PrincipalDetail(userEntity, oauth2User.getAttributes());
	}
	
}
