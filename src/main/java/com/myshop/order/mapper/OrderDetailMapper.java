package com.myshop.order.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderDetailMapper {

	public void insertOrderDetail(
			@Param("orderId") int orderId,
			@Param("productId") int productId, 
			@Param("option") String option,
			@Param("price") int price,
			@Param("amount") int amount);
}
