package com.myshop.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.myshop.like.bo.LikeSetBO;
import com.myshop.like.domain.LikeSet;
import com.myshop.product.bo.ProductBO;
import com.myshop.product.bo.ProductThumbnailBO;
import com.myshop.product.domain.Product;
import com.myshop.product.domain.ProductThumbnail;
import com.myshop.productSet.bo.ProductSetBO;
import com.myshop.productSet.domain.ProductSet;

@RequestMapping("/site-name")
@Controller
public class MainController {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private LikeBO likeBO;

	@Autowired
	private ProductSetBO productSetBO;

	@Autowired
	private CartSetBO cartSetBO;

	@Autowired
	private LikeSetBO likeSetBO;
	
	@Autowired
	private ProductBO productBO;
	
	@Autowired
	private ProductThumbnailBO productThumbnailBO;
	
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

	@GetMapping("/product/category/{categoryId}")
	public String productCategory(Model model, @PathVariable int categoryId, HttpSession session) {
		List<ProductSet> productList = productSetBO.generateProductSetListByCategoryId(categoryId);
		model.addAttribute("productList", productList);
		model.addAttribute("viewName", "main/category");
		return "template/layout";
	}

	@GetMapping("/product/category/{categoryId}/{subclassId}")
	public String productCategory(Model model, @PathVariable int categoryId, @PathVariable int subclassId,
			HttpSession session) {
		List<ProductSet> productList = productSetBO.generateProductSetListByCategoryIdSubclassId(categoryId,
				subclassId);
		model.addAttribute("productList", productList);
		model.addAttribute("viewName", "main/subclass");
		return "template/layout";
	}

	@GetMapping("/product/{productId}")
	public String productDetailView(Model model, @PathVariable int productId, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
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

	@GetMapping("/order")
	public String orderView(Model model, HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		Map<String, Object> cookieMap = new HashMap<>();
		if (cookies != null) {
			for (Cookie c : cookies) {
				cookieMap.put(c.getName(), c.getValue());
			}
		}
		Product product = productBO.getProductById(Integer.parseInt(cookieMap.get("productId").toString()));
		ProductThumbnail productThumbnail = productThumbnailBO.getProductThumbnailByProductId(Integer.parseInt(cookieMap.get("productId").toString()));
		
		logger.info("$$$$$$$$$$$$$$$$$ productId : {}", cookieMap.get("productId"));
		model.addAttribute("option", cookieMap.get("option"));
		model.addAttribute("product", product);
		model.addAttribute("productThumbnail", productThumbnail);
		model.addAttribute("viewName", "order/order");
		return "template/layout";
	}

	@GetMapping("/my-page/{userName}")
	public String myPageView(@PathVariable String userName, Model model, HttpSession session) {

		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			// 비로그인이면 로그인 페이지로 이동
			return "redirect:/site-name/sign-in-view";
		}

		model.addAttribute("viewName", "user/myPage");
		return "template/layout";
	}

	@GetMapping("/my-page/cart")
	public String myCaryView(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			// 비로그인이면 로그인 페이지로 이동
			return "redirect:/site-name/sign-in-view";
		}

		List<CartSet> cartSetList = cartSetBO.generateCartSet(userId);
		model.addAttribute("cartSetList", cartSetList);

		model.addAttribute("viewName", "user/cart");
		return "template/layout";
	}

	@GetMapping("/my-page/order-view")
	public String orderView() {
		return "user/include/myOrder";
	}

	@GetMapping("/my-page/cart-view")
	public String cartView(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			// 비로그인이면 로그인 페이지로 이동
			return "redirect:/site-name/sign-in-view";
		}

		List<CartSet> cartSetList = cartSetBO.generateCartSet(userId);
		model.addAttribute("cartSetList", cartSetList);
		return "user/include/myCart";
	}

	@GetMapping("/my-page/like-view")
	public String likeView(Model model, HttpSession session) {
		Integer userId = (Integer) session.getAttribute("userId");
		if (userId == null) {
			// 비로그인이면 로그인 페이지로 이동
			return "redirect:/site-name/sign-in-view";
		}

		List<LikeSet> likeSetList = likeSetBO.generateLikeSet(userId);
		model.addAttribute("likeSetList", likeSetList);
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
