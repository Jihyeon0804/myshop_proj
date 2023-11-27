package com.myshop.kakao;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.common.EncryptUtils;
import com.myshop.kakao.bo.KaKaoBO;
import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.User;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/kakao")
public class KaKaoLoginController {

	@Autowired
	private KaKaoBO kakaoBO;

	@Autowired
	private UserBO userBO;
	
	@Autowired
	private EncryptUtils encryptUtils;

	@Transactional
	@GetMapping("/login/result")
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) {
		Logger logger = LoggerFactory.getLogger(this.getClass());
		logger.info("################## code : {}", code);

		String access_Token = kakaoBO.getAccessToken(code);
		logger.info("################## code : {}", code);

		Map<String, Object> userInfo = new HashMap<>();
		userInfo = kakaoBO.getUserInfo(access_Token);
		logger.info("################## access_Token : {}", access_Token);
		logger.info("################## kakao_name : {}", userInfo.get("name"));
		logger.info("################## kakao_id : {}", userInfo.get("loginId"));
		logger.info("################## kakao_email : {}", userInfo.get("email"));
		String loginId = (String) userInfo.get("loginId");
		String name = (String) userInfo.get("name");
		String email = (String) userInfo.get("email");
		String password = "";
		try {
			password = encryptUtils.encrypt("kakao11122");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String phoneNumber = null;
		String birth = null;
		String joinType = "소셜";

		User user = userBO.existUserByLoginIdAndPassword(loginId, password);
		if (user == null) {
			userBO.addUser(loginId, password, name, email, phoneNumber, birth, joinType);
			user = userBO.existUserByLoginIdAndPassword(loginId, password);
			session.setAttribute("userId", user.getId());
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userName", user.getName());
			session.setAttribute("email", user.getEmail());
			session.setAttribute("phoneNumber", user.getPhoneNumber());
			session.setAttribute("birth", user.getBirth());
			session.setAttribute("address", user.getAddress());
			session.setAttribute("grade", user.getGrade());
		} else {
			session.setAttribute("userId", user.getId());
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
