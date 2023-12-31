package com.myshop.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.common.EncryptUtils;
import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.User;

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private EncryptUtils encryptUtils;
	
	@Value("${my.admin-id}")
	private String adminId;
	
	@Value("${my.admin-pw}")
	private String adminPw;
	
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
		
		String hashedpw = "";
		
		try {
			hashedpw = encryptUtils.encrypt(password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// insert
		String joinType = "일반";
		userBO.addUser(loginId, hashedpw, name, email, phoneNumber, birth, joinType);
		
		// 응답
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		result.put("result", "성공");
		
		return result;
	}
	
	
	@PostMapping("/sign-in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		String hashedpw = "";
		try {
			hashedpw = encryptUtils.encrypt(password);
			adminPw = encryptUtils.encrypt(adminPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
		User user = userBO.existUserByLoginIdAndPassword(loginId, hashedpw);
		
		if (user != null) {
			if (loginId.equals(adminId) || hashedpw.equals(adminPw)) {
				session.setAttribute("userId", user.getId());
				session.setAttribute("userLoginId", user.getLoginId());
				session.setAttribute("userName", user.getName());
				
				result.put("code", 00);
				result.put("result", "admin");
			} else {
				session.setAttribute("userId", user.getId());
				session.setAttribute("userLoginId", user.getLoginId());
				session.setAttribute("userName", user.getName());
				session.setAttribute("email", user.getEmail());
				session.setAttribute("phoneNumber", user.getPhoneNumber());
				session.setAttribute("birth", user.getBirth());
				session.setAttribute("address", user.getAddress());
				session.setAttribute("grade", user.getGrade());
				
				result.put("code", 200);
				result.put("result", "로그인 성공");
			}
		} else {
			result.put("code", 500);
			result.put("errorMessage", "일치하는 회원 정보가 없습니다.");
		}
		return result;
	}
}
