package com.test.ajax.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration		//환경 설정 클래스
@EnableSwagger2		//Swagger2 동작 가능
public class SwaggerConfig {

	
	//API Document 생성 메서드
	@Bean
	public Docket api() {
		
		return new Docket(DocumentationType.SWAGGER_2)
					.apiInfo(getApiInfo()) //문서 정보
					.select() //문서 빌더 시작
					.apis(RequestHandlerSelectors.basePackage("com.test.ajax"))
					.paths(PathSelectors.any()) //어떤 경로 기능을 포함(전체)
					//.paths(PathSelectors.ant("/user/sec/**")) //어떤 경로 기능을 포함(선택)
					.build();
	}

	//문서 제목, 버전, 설명 등 API의 기본 설명
	private ApiInfo getApiInfo() {
		
		return new ApiInfoBuilder()
					.title("User REST API")
					.version("0.0.1")
					.description("User 데이터에 대한 REST API 명세입니다.")
					.build();
		
	}
	
}
