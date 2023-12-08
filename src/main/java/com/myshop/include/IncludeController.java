package com.myshop.include;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.qna.bo.QnaBO;
import com.myshop.qna.domain.Qna;
import com.myshop.review.bo.ReviewBO;
import com.myshop.review.domain.ReviewSet;

@RequestMapping("/include")
@Controller
public class IncludeController {

	@Autowired
	private QnaBO qnaBO;
	
	@Autowired
	private ReviewBO reviewBO;
	
	@GetMapping("/product-detail-view")
	public String productDetailInclude() {
		return "product/include/description";
	}
	
	@GetMapping("/product-review-view")
	public String productReviewInclude(Model model, int productId) {
		
		List<ReviewSet> reviewSetList = reviewBO.generateReviewSetList(productId);
//		List<Review> reviewList = reviewBO.getReviewListByProductId(productId);
		model.addAttribute("reviewSetList", reviewSetList);
		return "product/include/review";
	}
	
	@GetMapping("/product-qna-view")
	public String productQnaInclude(Model model, HttpSession session, int productId) {
		List<Qna> qnaList = qnaBO.generateQnaList(productId);
		model.addAttribute("qnaList", qnaList);
		return "product/include/qna";
	}
}
