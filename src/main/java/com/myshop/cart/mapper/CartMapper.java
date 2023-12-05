package com.myshop.cart.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CartMapper {

	public void insertCart(
			@Param("userId") int userId,
			@Param("productId") int productId,
			@Param("optionId") Integer optionId,
			@Param("amount") int amount);
}
