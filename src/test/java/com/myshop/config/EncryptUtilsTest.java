package com.myshop.config;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import com.myshop.common.EncryptUtils;

@SpringBootTest
public class EncryptUtilsTest {

	@Autowired
	EncryptUtils encryptUtils;
	
	@Transactional		// rollback
	@Test
	void aes테스트() {
		Logger logger = LoggerFactory.getLogger(this.getClass());
		try {
			String encode = encryptUtils.encrypt("kakao1122");
			String decode = encryptUtils.decrypt(encode);
			logger.info("$$$$$$$$$$$$$$$$$$$$$$$ encode: {}", encode);
			logger.info("$$$$$$$$$$$$$$$$$$$$$$$ decode: {}", decode);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
