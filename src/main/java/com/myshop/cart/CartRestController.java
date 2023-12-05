package com.myshop.cart;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/cart")
@RestController
public class CartRestController {

	@PostMapping("/product-add")
	public Map<String, Object> addProduct() {
		Map<String, Object> result = new HashMap<>();
		
		
		return result;
	}
}
