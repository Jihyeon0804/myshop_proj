package com.myshop;

import java.util.List;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class 람다테스트 {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	// @Test
	void 람다테스트1() {
		List<String> list = List.of("apple", "banana", "grape");

		// 문자열이 b로 시작할 경우 출력
		list
		.stream() // 계속 줄줄이 이어지다.
		.filter(e -> e.startsWith("b"))
		.forEach(e -> logger.info("######## {}", e));
	}

	//@Test
	void 람다테스트2() {
		List<String> list = List.of("apple", "banana", "grape");

		// 문자열을 대문자로 바꾸기
		list = list
		.stream()
		.map(e -> e.toUpperCase())	// stream
		.collect(Collectors.toList());	// stream to list
		
		logger.info("######## {}", list);
	}
	
	@Test
	void 메소드레퍼런스() {
		List<String> list = List.of("apple", "banana", "grape");
		
		// 문자열을 대문자로 바꾸기
		list = list
		.stream()
		.map(String::toUpperCase) 	// e -> e.toUpperCase() 와 동일
		.collect(Collectors.toList());
		
		logger.info("$$$$$$$$ {}", list);
	}
}
