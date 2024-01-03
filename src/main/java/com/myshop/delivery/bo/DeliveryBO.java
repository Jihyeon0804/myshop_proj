package com.myshop.delivery.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myshop.delivery.domain.Delivery;
import com.myshop.delivery.mapper.DeliveryMapper;

@Service
public class DeliveryBO {

	@Autowired
	private DeliveryMapper deliveryMapper;
	
	public Delivery getDeliveryByOrderId(int orderId) {
		return deliveryMapper.selectDeliveryByOrderId(orderId);
	}
}
