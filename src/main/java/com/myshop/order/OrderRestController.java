package com.myshop.order;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myshop.order.bo.OrderBO;
import com.myshop.order.bo.OrderDetailBO;
import com.myshop.order.domain.Order;

@RestController
@RequestMapping("/order")
public class OrderRestController {
	
	@Autowired
	private OrderBO orderBO;
	
	@Autowired
	private OrderDetailBO orderDetailBO;

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

	@PostMapping("/payment")
	public Map<String, Object> importPayment(
			@RequestParam("productId") int productId,
			@RequestParam("option") String option,
			@RequestParam("orderName") String orderName,
			@RequestParam("address") String address,
			@RequestParam("phoneNumber") String phoneNumber,
			@RequestParam("amount") int amount,
			@RequestParam("totalPrice") int totalPrice,
			@RequestParam("amount") int deliveryPrice,
			HttpSession session, HttpServletResponse response
			) {
		Cookie cookie = new Cookie("productId", null);
		Cookie cookie2 = new Cookie("option", null);
		Cookie cookie3 = new Cookie("amount", null);
		Cookie cookie4 = new Cookie("price", null);
		cookie.setMaxAge(0);
		cookie.setPath("/");
	    response.addCookie(cookie);
	    cookie2.setMaxAge(0);
	    cookie2.setPath("/");
	    response.addCookie(cookie2);
	    cookie3.setMaxAge(0);
	    cookie3.setPath("/");
	    response.addCookie(cookie3);
	    cookie4.setMaxAge(0);
	    cookie4.setPath("/");
	    response.addCookie(cookie4);
		int userId = (int)session.getAttribute("userId");
		Order order = new Order();
		order.setUserId(userId);
		order.setOrderName(orderName);
		order.setAddress(address);
		order.setMessage("test");
		order.setPhoneNumber(phoneNumber);
		order.setAmount(amount);
		order.setTotalPrice(totalPrice);
		order.setDeliveryPrice(deliveryPrice);
		orderBO.addOrder(order);
		
		int orderId = order.getId();
		orderDetailBO.addOrderDetail(orderId, productId, option, totalPrice, amount);

		Map<String, Object> result = new HashMap<>();
		
		result.put("code", 200);
		result.put("result", "성공");
		return result;
	}
	

}
