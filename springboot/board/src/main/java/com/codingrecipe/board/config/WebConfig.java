package com.codingrecipe.board.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration //설정하는 어노테이션 > xml, 클래스로도 가능
public class WebConfig implements WebMvcConfigurer {
    private String resourcePath = "/upload/**"; //view에서 사용할 경로
    private String savePath = "file:///Users/choeyujeong/class/code/springboot/board/spring_upload_files/"; //실제 파일 저장 경로

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler(resourcePath)
                .addResourceLocations(savePath);
    }

}
