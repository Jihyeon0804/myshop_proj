package com.myshop;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest		// spring boot를 기동 (spring boot 기반 테스트를 진행할 경우 필요)
class MyshopApplicationTests {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Test
	void 더하기테스트() {
		logger.debug("######### 더하기 테스트 수행 ##########");
		int a = 10;
		int b = 20;
		assertEquals(30, a + b);
	}
}
