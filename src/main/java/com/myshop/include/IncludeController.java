package com.myshop.include;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/include")
@Controller
public class IncludeController {

	@GetMapping("/product-detail-view")
	public String productDetailInclude() {
		return "product/include/description";
	}
	
	@GetMapping("/product-review-view")
	public String productReviewInclude() {
		return "product/include/review";
	}
	
	@GetMapping("/product-qna-view")
	public String productQnaInclude() {
		return "product/include/qna";
	}
}
