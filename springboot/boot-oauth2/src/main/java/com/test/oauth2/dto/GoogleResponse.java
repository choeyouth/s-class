package com.test.oauth2.dto;

import java.util.Map;

public class GoogleResponse implements OAuth2Response {

	private final Map<String,Object> attribute;
	
	//구글 데이터 구조 <-> 네이버 데이터 구조 차이 
	public GoogleResponse(Map<String,Object> attribute) {
		this.attribute = attribute;
	}
	
	@Override
	public String getProvider() {

		return "google";
	}

	@Override
	public String getProviderId() {

		return attribute.get("sub").toString();
	}

	@Override
	public String getEmail() {

		return attribute.get("email").toString();
	}

	@Override
	public String getName() {

		return attribute.get("name").toString();
	}
}
