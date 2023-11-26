package com.myshop.inquire;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.inquire.bo.InquireBO;

@RequestMapping("/inquire")
@RestController
public class InquireRestController {
	
	@Autowired
	private InquireBO inquireBO;
	
	@PostMapping("/add")
	public Map<String, Object> requestInquire(
			@RequestParam("productId") int productId,
			@RequestParam("type") String type,
			@RequestParam("title") String title,
			@RequestParam("content") String content,
			HttpSession session) {
		
		int userId = (int)session.getAttribute("userId");
		inquireBO.addInquire(userId, productId, type, title, content);
		
		Map<String, Object> result = new HashMap<>();
		result.put("code", 200);
		return result;
	}
}
