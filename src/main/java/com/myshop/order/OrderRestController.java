package com.myshop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/order")
public class OrderRestController {

	@PostMapping("/pay")
	public Map<String, Object> payment(
			Model model,
			@RequestParam("productId") int productId,
			@RequestParam("option") String option,
			@RequestParam("amount") int amount,
			@RequestParam("price") int price,
			HttpServletResponse response) {
		option = option.replaceAll("[^ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9,. ]", "");
		option = option.replace(",", "/");
		option = option.replace(" ", "-");
		Cookie cookie = new Cookie("productId", Integer.toString(productId));
		Cookie cookie2 = new Cookie("option", option);
		Cookie cookie3 = new Cookie("amount", Integer.toString(amount));
		Cookie cookie4 = new Cookie("price", Integer.toString(price));
		cookie.setPath("/");
		cookie2.setPath("/");
		cookie3.setPath("/");
		cookie4.setPath("/");
		response.addCookie(cookie);
		response.addCookie(cookie2);
		response.addCookie(cookie3);
		response.addCookie(cookie4);
		
		
		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 200);
		result.put("result", "성공");
		return result;
	}

}
