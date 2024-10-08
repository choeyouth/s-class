package com.test.java.file;

// 데이터 전달용 상자 
// DTO > private 멤버변수 + Getter + Setter (일반적인 구성 방식)


public class ScoreDTO {

	
	private String name;
	private int kor;
	private int eng;
	private int math;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKor() {
		return kor;
	}
	public void setKor(int kor) {
		this.kor = kor;
	}
	public int getEng() {
		return eng;
	}
	public void setEng(int eng) {
		this.eng = eng;
	}
	public int getMath() {
		return math;
	}
	public void setMath(int math) {
		this.math = math;
	}
	
	
	@Override
	public String toString() {
		return "ScoreDTO [name=" + name + ", kor=" + kor + ", eng=" + eng + ", math=" + math + "]";
	}
	
	
	
}
