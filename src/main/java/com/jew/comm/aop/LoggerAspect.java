package com.jew.comm.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

public class LoggerAspect {

	Logger logger = LoggerFactory.getLogger(LoggerAspect.class);
	
	/**
	 * AOP구현 : 특정 로직에 대해서 성능 확인 (속도 체크) 
	 */
	
	public Object startLog(ProceedingJoinPoint jp) throws Throwable {
		String signatureStr=jp.getSignature().toShortString();
		//System.out.println(signatureStr);
		logger.info(signatureStr);
		
		StopWatch stopWatch =new StopWatch();
		stopWatch.start();
		
		
		Object proceed=jp.proceed();
		
		stopWatch.stop();
		
		//System.out.println(stopWatch.prettyPrint());
		logger.info(stopWatch.prettyPrint());
		
		return proceed;
	}
	

}
