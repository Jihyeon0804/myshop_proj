package com.myshop.batch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
public class TestTaskJob {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// @Scheduled(cron = "1 * * * * *")
	public void test() {
		// job 내용
		logger.info("################# test job 수행");
	}
}
