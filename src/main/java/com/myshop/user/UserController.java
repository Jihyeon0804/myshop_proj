package com.myshop.user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.KaKaoUser;
import com.myshop.user.domain.OAuthToken;
import com.myshop.user.mapper.UserMapper;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private UserBO userBO;
	
	
	@RequestMapping("/sign-out")
	public String signOut(HttpSession session) {
		session.removeAttribute("userLoginId");
		session.removeAttribute("userName");
		session.removeAttribute("email");
		session.removeAttribute("phoneNumber");
		session.removeAttribute("birth");
		session.removeAttribute("address");
		session.removeAttribute("grade");
		return "redirect:/site-name";
	}

	@GetMapping("/kakao/oauth")
	public void oauthCallback(String code) {
		// POST 방식으로 json 데이터 요청
		RestTemplate rt = new RestTemplate();

		// HttpHeader Object
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpBody Object
		MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code"); // 고정 값
		params.add("client_id", "5fe0b7f721365d472ac1462d40d94415"); // 앱 REST API 키
		params.add("redirect_uri", "http://site-name/user/kakao/oauth"); // 인가 코드가 리다이렉트된 URI
		params.add("code", code); // 인가 코드 받기 요청으로 얻은 인가 코드

		// HttpHeader + HttpBody Object
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

		// Http request(POST) => response
		ResponseEntity<String> response = rt.exchange("https://kauth.kakao.com/oauth/token", HttpMethod.POST, // 요청할 방식
				kakaoTokenRequest, // 요청할 때 보낼 데이터
				String.class // 요청 시 반환되는 데이터 타입
		);

		// Gson, Json Simgple, Object Mapper
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;

		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		// 로그인 사용자 정보 가져오기
		RestTemplate rt_2 = new RestTemplate();

		HttpHeaders headers_2 = new HttpHeaders();
		headers_2.add("Authorization", "Bearer" + oauthToken.getAccess_token());
		headers_2.add("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader + HttpBody Object
		HttpEntity<MultiValueMap<String, String>> kakaoUserRequest = new HttpEntity<>(headers_2);

		// Http request(POST) => response
		ResponseEntity<String> response_2 = rt_2.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST, // 요청 방식
				kakaoUserRequest, // 요청할 때 보낼 데이터
				String.class // 요청 시 반환되는 데이터 타입
		);

		ObjectMapper objectMapper2 = new ObjectMapper();
		KaKaoUser kakaoUser = null;

		try {
			kakaoUser = objectMapper2.readValue(response_2.getBody(), KaKaoUser.class);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		userBO.addUser("9999", "9999", kakaoUser.getProperties().getNickname(),
				kakaoUser.getKakao_account().getEmail(), "9999", "999");

	}

}
