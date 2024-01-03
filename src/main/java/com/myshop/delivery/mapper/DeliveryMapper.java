package com.myshop.delivery.mapper;

import org.springframework.stereotype.Repository;

import com.myshop.delivery.domain.Delivery;

@Repository
public interface DeliveryMapper {

	public Delivery selectDeliveryByOrderId(int orderId);
}
