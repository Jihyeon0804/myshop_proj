package com.myshop.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.myshop.common.FileManagerService;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	// 웹 이미지 path와 서버에 업로드 된 이미지 매핑 설정
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		registry
		// web image path =>
		// http://localhost/images/1_1698942335689/the-cat-8317334_640.jpg
		// 주소를 직접 입력하더라도 저장된 이미지가 보이도록 설정
		.addResourceHandler("/images/**")
		// 내 서버에서 images 밑에있는 실제 파일 경로
		.addResourceLocations("file:///" + FileManagerService.FILE_UPLOAD_PATH);
	}
}
