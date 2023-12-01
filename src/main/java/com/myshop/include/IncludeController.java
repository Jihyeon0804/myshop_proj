package com.myshop.include;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.inquire.bo.InquireBO;
import com.myshop.inquire.domain.Inquire;
import com.myshop.user.bo.UserBO;
import com.myshop.user.domain.User;

@RequestMapping("/include")
@Controller
public class IncludeController {

	@Autowired
	private InquireBO inquireBO;
	
	@Autowired
	private UserBO userBO;
	
	@GetMapping("/product-detail-view")
	public String productDetailInclude() {
		return "product/include/description";
	}
	
	@GetMapping("/product-review-view")
	public String productReviewInclude() {
		return "product/include/review";
	}
	
	@GetMapping("/product-qna-view")
	public String productQnaInclude(Model model) {
		List<Inquire> inquireList = inquireBO.getInquire();
		List<User> userList = userBO.getUserList();
		model.addAttribute("inquireList", inquireList);
		model.addAttribute("userList", userList);
		return "product/include/qna";
	}
}
