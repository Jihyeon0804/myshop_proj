package com.myshop.kakao;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.kakao.bo.KaKaoBO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/kakao")
public class KaKaoLoginController {

	@Autowired
	private KaKaoBO kakaoBO;
	
	@GetMapping("/login/result")
	public String kakaoConnect(@RequestParam("code") String code) {
		Logger logger = LoggerFactory.getLogger(this.getClass());
		logger.info("################## code : {}", code);
		
        
		String access_Token = kakaoBO.getAccessToken(code);
		logger.info("################## code : {}", code);
		System.out.println("###access_Token#### : " + access_Token);
		
		Map<String, Object> userInfo = new HashMap<>();
		userInfo = kakaoBO.getUserInfo(access_Token);
		logger.info("################## access_Token : {}", access_Token);
		logger.info("################## kakao_name : {}", userInfo.get("name"));
		logger.info("################## kakao_id : {}", userInfo.get("loginId"));
		logger.info("################## kakao_email : {}", userInfo.get("email"));
		
        
		return "test/test";
    	
	}
	
}
