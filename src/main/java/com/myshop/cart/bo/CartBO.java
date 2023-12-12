package com.myshop.cart.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.cart.domain.Cart;
import com.myshop.cart.mapper.CartMapper;

@Service
public class CartBO {

	@Autowired
	private CartMapper cartMapper;
	
	public void addCart(int userId, int productId, String option, int amount) {
		cartMapper.insertCart(userId, productId, option, amount);
	}
	
	
	public List<Cart> getCartListByUserId(int userId) {
		return cartMapper.selectCartListByUserId(userId);
	}
	
	public void deleteCartById(int cartId) {
		cartMapper.deleteCartById(cartId);
	}
}
