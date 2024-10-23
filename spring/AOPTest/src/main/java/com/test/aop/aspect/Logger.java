package com.test.aop.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component	//<bean>
@Aspect		//<aop:aspect ref="logger"> 역할 부여
public class Logger {

	@Pointcut("execution(public * com.test.aop.dao.AOPDAO.add(..))")
	public void pc1() {} //구현부(X) > 어노테이션을 선언하기 위한 메서드

	//AOP 실행 시 보조 업무를 같이 실행시키기
	@After("pc1()")
	public void m1() {
		System.out.println("[LOG] 로그를 작성합니다.");
	}
}
