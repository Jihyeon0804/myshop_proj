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
		
		// 중복 확인
		if (userBO.getUserCountByLoginId(loginId) > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}

		return result;
	}
}
