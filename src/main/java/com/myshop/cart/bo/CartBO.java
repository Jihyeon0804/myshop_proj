package com.myshop.cart.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.cart.mapper.CartMapper;

@Service
public class CartBO {

	@Autowired
	private CartMapper cartMapper;
	
	public void addCart(int userId, int productId, Integer optionId, int amount) {
		cartMapper.insertCart(userId, productId, optionId, amount);
	}
}
