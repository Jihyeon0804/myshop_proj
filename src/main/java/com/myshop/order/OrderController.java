package com.myshop.order;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

	@RequestMapping("/payment")
	public String payment() {
		return "order/payment";
	}
}
