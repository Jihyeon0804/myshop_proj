package com.myshop.user.bo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest		// spring boot 부팅
class UserBOTest {

	@Autowired
	UserBO userBO;
	
	@Transactional		// rollback
	@Test
	void 아이디_중복확인_테스트() {
		userBO.getUserCountByLoginId("qwertyuio");
	}

}
