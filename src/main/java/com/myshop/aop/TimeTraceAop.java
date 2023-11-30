package com.myshop.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect		// 부가 기능 정의(advice) + 적용될 위치(pointcut) => 합친 것임
@Component
public class TimeTraceAop {		// Singleton
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	@Around("execution(* com.myshop..*(..))")		// 1. 패키지 범위 => 적용될 위치(pointcut)
	@Around("@annotation(TimeTrace)")	// 어느 어노테이션이 붙어있을 때 사용할 것인가? @Around("@annotation(어노테이션명)")
	public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
		// 타겟이 적용되는 메소드 - joinPoint (어느 메소드에 껴넣을 것인가)
		
		// 시간 측정 로직
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		Object proceedObj = joinPoint.proceed();	// 본래 할 일 수행 (예: 회원가입)
		
		stopWatch.stop();
		logger.info("######### 실행시간(ms): " + stopWatch.getTotalTimeMillis());
		logger.info(stopWatch.prettyPrint());
		
		return proceedObj;
	}
}
