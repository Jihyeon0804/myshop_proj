package com.myshop.main;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.aop.TimeTrace;
import com.myshop.cart.bo.CartSetBO;
import com.myshop.cart.domain.CartSet;
import com.myshop.like.bo.LikeBO;
import com.myshop.productSet.bo.ProductSetBO;
import com.myshop.productSet.domain.ProductSet;

@RequestMapping("/site-name")
@Controller
public class MainController {
	
	@Autowired
	private LikeBO likeBO;


	@Autowired
	private ProductSetBO productSetBO;
	
	@Autowired
	private CartSetBO cartSetBO;
	
	@GetMapping("")
	public String siteView(Model model) {
		List<ProductSet> productSetList = productSetBO.generateProductSetList();
		model.addAttribute("productSetList", productSetList);
		model.addAttribute("viewName", "main/main");
		return "template/layout";
	}
	
	@TimeTrace
	@GetMapping("/sign-in-view")
	public String signInView(Model model) {
		model.addAttribute("viewName", "user/signIn");
		return "template/layout";
	}
	
	@GetMapping("/product/{productId}")
	public String productDetailView(Model model, @PathVariable int productId, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		boolean likeStatus = likeBO.likeStatus(productId, userId);
		model.addAttribute("likeStatus", likeStatus);
		
		ProductSet productSet = productSetBO.generateProductSet(productId);
		model.addAttribute("productSet", productSet);
		
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
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			// 비로그인이면 로그인 페이지로 이동
			return "redirect:/site-name/sign-in-view";
		}
		
		model.addAttribute("viewName", "user/myPage");
		return "template/layout";
	}
	
	@GetMapping("/my-page/cart")
	public String myCaryView(Model model, HttpSession session) {
		Integer userId = (Integer)session.getAttribute("userId");
		if (userId == null) {
			// 비로그인이면 로그인 페이지로 이동
			return "redirect:/site-name/sign-in-view";
		}
		
		List<CartSet> cartSetList =  cartSetBO.generateCartSet(userId);
		model.addAttribute("cartSetList", cartSetList);
		
		model.addAttribute("viewName", "user/cart");
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
