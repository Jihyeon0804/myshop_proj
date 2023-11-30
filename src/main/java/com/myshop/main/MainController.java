package com.myshop.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.aop.TimeTrace;

@RequestMapping("/site-name")
@Controller
public class MainController {

	@GetMapping("")
	public String siteView(Model model) {
		model.addAttribute("viewName", "main/main");
		return "template/layout";
	}
	
	@TimeTrace
	@GetMapping("/sign-in-view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
	}
	
	@GetMapping("/product")
	public String productDetailView(Model model) {
		model.addAttribute("viewName", "product/productDetails");
		model.addAttribute("detailviewName", "product/include/description");
		
		return "template/layout";
	}
	
	
	@GetMapping("/sign-up-view")
	public String signUpView(Model model) {
		model.addAttribute("viewName", "user/signUp");
		return "template/layout";
	}
	
	
	
	@GetMapping("/my-page/{userName}")
	public String myPageView(@PathVariable String userName, Model model, HttpSession session) {
		model.addAttribute("viewName", "user/myPage");
		return "template/layout";
	}
	
	@GetMapping("/my-page/order-view")
	public String orderView() {
		return "user/include/myOrder";
	}
	
	@GetMapping("/my-page/cart-view")
	public String cartView() {
		return "user/include/myCart";
	}
	
	@GetMapping("/my-page/like-view")
	public String likeView() {
		return "user/include/myPick";
	}
	
	@GetMapping("/my-page/review-view")
	public String ReviewView() {
		return "user/include/myReview";
	}
	
	@GetMapping("/my-page/info-revise-view")
	public String infoReviseView() {
		return "user/include/myInfoRevise";
	}
}
