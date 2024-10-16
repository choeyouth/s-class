package com.test.begin.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		
		//주업무 객체
		//Memo memo = new MemoImpl();
		
		ApplicationContext context = new ClassPathXmlApplicationContext("com/test/begin/aop/memo.xml");
		Memo memo = (Memo)context.getBean("memo");
		
		//글쓰기
		memo.add("스프링 수업 중..");
		
		//글읽기
		String content;

		try {
			content = memo.read(101);
			System.out.println(content);
		} catch (Exception e) {
			//e.printStackTrace();
			System.out.println("예외처리");
		}
		
		
		//글수정
		boolean result = memo.edit(10, "수정한 내용");
		System.out.println(result);
		
		//글삭제
		result = memo.del(10);
		System.out.println(result);
		
		//비밀글
		memo.addSecret("비밀글");
	}
}
