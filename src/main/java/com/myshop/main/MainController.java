package com.myshop.main;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/site-name")
@Controller
public class MainController {

	@GetMapping("")
	public String siteView(Model model) {
		model.addAttribute("viewName", "main/main");
		return "template/layout";
	}
	
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
}
