package com.myshop.naver.bo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.User;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/naver")
public class NaverLoginController {

	@Autowired
	private NaverBO naverBO;
	
	@Autowired
	private UserBO userBO;
	
	@GetMapping("/login/result")
	public String naverLogin(@RequestParam("code") String code, HttpSession session) {
		Logger logger = LoggerFactory.getLogger(this.getClass());
		logger.info("################## code : {}", code);

		String access_Token = naverBO.getAccessToken(code);
		logger.info("################## access_Token : {}", access_Token);
		
		Map<String, Object> userInfo = new HashMap<>();
		userInfo = naverBO.getUserInfo(access_Token);
		logger.info("################## naver_name : {}", userInfo.get("name"));
		logger.info("################## naver_id : {}", userInfo.get("loginId"));
		logger.info("################## naver_email : {}", userInfo.get("email"));
		String loginId = (String) userInfo.get("loginId");
		String name = (String) userInfo.get("name");
		String email = (String) userInfo.get("email");
		String password = "naver1122";
		String phoneNumber = null;
		String birth = null;
		String joinType = "소셜";

		User user = userBO.existUserByLoginIdAndPassword(loginId, password);
		if (user == null) {
			userBO.addUser(loginId, password, name, email, phoneNumber, birth, joinType);
			user = userBO.existUserByLoginIdAndPassword(loginId, password);
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("phoneNumber", user.getPhoneNumber());
			session.setAttribute("birth", user.getBirth());
			session.setAttribute("address", user.getAddress());
			session.setAttribute("grade", user.getGrade());
		} else {
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("phoneNumber", user.getPhoneNumber());
			session.setAttribute("birth", user.getBirth());
			session.setAttribute("address", user.getAddress());
			session.setAttribute("grade", user.getGrade());
		}
		return "redirect:/site-name";
	}
}
