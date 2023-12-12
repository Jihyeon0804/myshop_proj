package com.myshop.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.like.bo.LikeBO;

@RestController
@RequestMapping("/like")
public class LikeRestController {

	@Autowired
	private LikeBO likeBO;
	
	@RequestMapping("/{productId}")
	public Map<String, Object> likeToggle(
			@PathVariable int productId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요.");
			return result;
		}
		
		likeBO.likeToggle(productId, userId);
		
		// 응답값
		result.put("code", 200);
		return result;
	}
	
	@PostMapping("/delete")
	public Map<String, Object> deleteLike(
			@RequestParam("productId") int productId,
			HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		Integer userId = (Integer)session.getAttribute("userId");
		likeBO.deleteLikeByProductIdUserId(productId, userId);
		
		result.put("code", 200);
		return result;
	}
	
}
