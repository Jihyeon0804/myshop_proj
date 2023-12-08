package com.myshop.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.myshop.review.bo.ReviewBO;
import com.myshop.review.bo.ReviewImageBO;
import com.myshop.review.domain.Review;

@RestController
@RequestMapping("/review")
public class ReviewRestController {

	@Autowired
	private ReviewBO reviewBO;
	
	@Autowired
	private ReviewImageBO reviewImageBO;
	
	@PostMapping("/post")
	public Map<String, Object> postReview(
			@RequestParam("productId") int productId,
			@RequestParam(value="files", required=false) List<MultipartFile> files,
			@RequestParam("content") String content,
			@RequestParam("point") int point,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (ObjectUtils.isEmpty(userId) == false) {
			Review review = new Review();
			review.setUserId(userId);
			review.setProductId(productId);
			review.setContent(content);
			review.setPoint(point);
			reviewBO.addReview(review);
			
			int reviewId =  review.getId();
			for (MultipartFile file : files) {
				reviewImageBO.addReviewImage(reviewId, file);
			}
			result.put("code", 200);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("errorMessage", "실패");
		}
		
		
		return result;
	}
}
