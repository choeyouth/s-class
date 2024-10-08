package com.test.memo.model;

//계층과 계층간에 데이터를 전송할 때 사용하는 컨테이너(택배상자)
//- tblMemo 테이블의 데이터 
//DTO 규칙
//1. 멤버 변수 > private
//2. getter/setter

public class MemoDTO {
	
	private String seq;
	private String name;
	private String pw;
	private String memo;
	private String regdate;
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	} 
}






















