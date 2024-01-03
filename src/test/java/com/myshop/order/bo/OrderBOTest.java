package com.myshop.order.bo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest	
class OrderBOTest {

	@Autowired
	OrderDetailBO orderDetailBO;
	
	@Transactional		// rollback
	@Test
	void 주문상세_테스트() {
		orderDetailBO.getOrderDetailList(2);
		
	}

}
