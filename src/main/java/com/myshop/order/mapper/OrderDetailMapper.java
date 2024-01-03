package com.myshop.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.myshop.order.domain.OrderDetail;

@Repository
public interface OrderDetailMapper {

	public void insertOrderDetail(
			@Param("orderId") int orderId,
			@Param("productId") int productId, 
			@Param("option") String option,
			@Param("price") int price,
			@Param("amount") int amount);
	
	public List<OrderDetail> selectOrderDetailList(int orderId);
}
