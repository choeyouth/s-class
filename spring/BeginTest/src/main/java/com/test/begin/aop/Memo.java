package com.test.begin.aop;

public interface Memo {
	
	void add(String memo);
	void addSecret(String memo);
	String read(int seq) throws Exception; //예외 미루기도 인터페이스에서 선언되어 있어야 한다.
	boolean edit(int seq, String memo);
	boolean del(int seq);

}
