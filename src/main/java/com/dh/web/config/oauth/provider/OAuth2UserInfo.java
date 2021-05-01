package com.dh.web.config.oauth.provider;

public interface OAuth2UserInfo {
	
	String getProviderId();
	String getProvider();
	String getEmail();
	String getName();
	String getPicture();

}
