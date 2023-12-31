package com.myshop;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Function;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.ObjectUtils;

import lombok.Getter;


//@SpringBootTest		// spring boot를 기동 (spring boot 기반 테스트를 진행할 경우 필요)
class MyshopApplicationTests {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public enum CalcType {		// java 7이하는 형태 다름
		// 열거형 정의
		CALC_A(value -> value),
		CALC_B(value -> value * 10),
		CALC_C(value -> value * 3),
		CALC_ETC(value -> 0);
		
		// enum에 정의된 function Function<input type, output type>
		private Function<Integer, Integer> expression;
		
		// 생성자
		CalcType(Function<Integer, Integer> expression) {
			this.expression = expression;
		}
		
		// 계산 적용 메소드
		public int calculate(int value) {
			return expression.apply(value);
		}
	}
	
	@Test
	void enum_test2() {
		// given - 준비
		CalcType type = CalcType.CALC_C;
		
		// when - 실행
		int result = type.calculate(500);
		
		// then - 검증
		assertEquals(result, 1500);
	}
	
	
	
	
	@Getter		// getting
	public enum Status {
		// 열거형 정의
		Y(1, true),		// 생성자 호출
		N(0, false);	// 생성자 호출
		
		// enum 항목에 정의된 필드; ()로 여러 개 지정한 경우 필드 정의 필요
		private int value1;			// 1, 0 mapping
		private boolean value2;		// true, false mapping
		
		// 생성자 ; 필드에 값을 세팅
		Status(int value1, boolean value2) {
			this.value1 = value1;
			this.value2 = value2;
		}
	}
	
	//@Test
	void enum_test1() {
		// given - 준비
		Status status = Status.Y;
		
		// when - 실행
		int value1 = status.getValue1();
		boolean value2 = status.isValue2();
		
		// then - 검증
		assertEquals(status, Status.Y);
		assertEquals(value1, 1);
		assertEquals(value2, true);
	}

	//@Test
	void 검사_테스트() {
//		String str = null;
		String str = "";
		if (ObjectUtils.isEmpty(str)) {		// null or ''
			logger.info("######## str은 null 또는 비어있다. ########");
		}
		
//		List<Integer> list = null;
		List<Integer> list = new ArrayList<>();
		if (ObjectUtils.isEmpty(list)) {	// null or []
			logger.info("$$$$$$$ list는 null이거나 비어있다. $$$$$$$$$");
		}
	}
	
	
	//@Test
	void 더하기_테스트() {
		logger.debug("######### 더하기 테스트 수행 ##########");
		int a = 10;
		int b = 20;
		assertEquals(30, a + b);
	}
	
	
}
