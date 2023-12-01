package com.myshop.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshop.user.domain.User;
import com.myshop.user.mapper.UserMapper;

@Controller
public class TestController {

	@Autowired
	private UserMapper userMapper;
	
	// 1. String + Response Body -> html
	@ResponseBody
	@GetMapping("/test1")
	public String test1() {
		return "Hello world";
	}

	// 2. Map + Response Body -> JSON
	@ResponseBody
	@GetMapping("/test2")
	public Map<String, Object> test2() {
		Map<String, Object> map = new HashMap<>();
		map.put("test", 1);
		map.put("테스트", "성공");
		map.put("a", "800");

		return map;
	}

	// 3. JSP -> html
	@GetMapping("/test3")
	public String test3() {
		return "test/test";
	}
	
	// 4. DB 연동 Response Body -> JSON
	@ResponseBody
	@GetMapping("/test4")
	public List<User> test4() {
		return userMapper.selectUserList();
	}
}