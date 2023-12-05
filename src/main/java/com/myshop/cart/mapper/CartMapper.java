package com.myshop.cart.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myshop.cart.domain.Cart;

@Repository
public interface CartMapper {

	public void insertCart(
			@Param("userId") int userId,
			@Param("productId") int productId,
			@Param("optionId") Integer optionId,
			@Param("amount") int amount);
	
	
	public List<Cart> selectCartListByUserId(int userId);
	
	public void deleteCartById(int cartId);
}
