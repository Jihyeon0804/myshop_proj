package com.myshop.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.user.bo.UserBO;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@PostMapping("/is-duplicated-id")
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		
		// 아이디 중복 확인
		if (userBO.getUserCountByLoginId(loginId) > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}

		return result;
	}
	
	
	@PostMapping("/sign-up")
	public Map<String, Object> signUp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("birth") String birth) {
		
		// insert
		userBO.addUser(loginId, password, name, email, phoneNumber, birth);
		
		// 응답
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "성공");
		
		return result;
	}
	
	
	@PostMapping("/sign-in")
	public Map<String, Object> signIp(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password) {
		
		Map<String, Object> result = new HashMap<>();
		
		
		// 아이디 중복 확인
		if (userBO.existUserByLoginIdAndPassword(loginId, password)) {
			result.put("code", 200);
			result.put("result", "로그인 성공");
		} else {
			result.put("code", 500);
			result.put("result", "일치하는 회원 정보가 없습니다.");
		}

		return result;
	}
	
}
