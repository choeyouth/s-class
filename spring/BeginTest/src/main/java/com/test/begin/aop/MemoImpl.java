package com.test.begin.aop;

//인터페이스 <- 클래스 
//1. IMemo  <-  Memo
//2. Memo   <-  MemoImpl
public class MemoImpl implements Memo {

	@Override
	public void add(String memo) {
		
		//주업무
		System.out.println("메모 쓰기: " + memo);
		
		//보조업무
		//Calendar now = Calendar.getInstance();
		//System.out.printf("%tF %tT\n", now, now);
		
		Logger logger = new Logger();
		logger.log("메모쓰기");
		
	}
	
	
	@Override
	public String read(int seq) throws Exception {

		if (seq == 10) {
			System.out.println("메모 읽기");
			
			return "메모입니다.";
		} else {
			throw new Exception("존재하지 않는 메모입니다.");
		}
	}
	
	@Override
	public boolean edit(int seq, String memo) {
	
		System.out.println("메모 수정: " + memo);
		
		return true;
	}
	
	@Override
	public boolean del(int seq) {
	
		System.out.println("메모 삭제: " + seq);
		
		return true;
	}
	
	@Override
	public void addSecret(String memo) {

		System.out.println("비밀메모: " + memo);
		
	}

	
}
