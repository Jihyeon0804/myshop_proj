 package com.myshop.cart;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.cart.bo.CartBO;

@RequestMapping("/cart")
@RestController
public class CartRestController {

	@Autowired
	private CartBO cartBO;
	
	@Transactional
	@PostMapping("/product-add")
	public Map<String, Object> addCartProduct(
			@RequestParam("productId") int productId
			, @RequestParam("option") String option
			, @RequestParam("amount") int amount
			, HttpSession session) {
		Map<String, Object> result = new HashMap<>();
		
		Integer userId = (Integer)session.getAttribute("userId");
		if (ObjectUtils.isEmpty(userId)) {
			result.put("code", 500);
			result.put("errorMessage", "로그인을 해주세요.");
		} else {
			cartBO.addCart(userId, productId, option, amount);
			result.put("code", 200);
			result.put("result", "장바구니 담기 성공");
		}

		return result;
	}
	
	@DeleteMapping("/product-delete")
	public Map<String, Object> deleteCartProduct(
			@RequestParam("cartId") int cartId) {
		Map<String, Object> result = new HashMap<>();
		if (ObjectUtils.isEmpty(cartId)) {
			result.put("code", 500);
			result.put("errorMessage", "장바구니 삭제를 실패했습니다. 다시 시도해주세요.");
		} else {
			cartBO.deleteCartById(cartId);
			result.put("code", 200);
			result.put("result", "장바구니 삭제 성공");
		}
		return result;
	}
}
