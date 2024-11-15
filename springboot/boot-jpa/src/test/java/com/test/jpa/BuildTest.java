package com.test.jpa;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class BuildTest {

	@Test
	void test() {
		
		//생성자를 사용한 객체 생성 단점
		//1. 초기화를 하고 싶지 않은 멤버를 처리하기 불편
		// - null 혹은 기본값 대입 > 가독성 저하 
		// - 생성자 다양하게 오버로딩 > 개발자 비용 발생 
		//2. 매개변수의 개수 or 순서 > 가독성 저하 
		
		
		//Address 클래스 > 사용 
		Member m1 = new Member(null, "상수", 3, "서울특별시 봉촌동", "f");
		
		//Member [seq=null, name=상수, age=3, address=서울특별시 봉촌동, gender=f]
		System.out.println(m1);
		
		
		//User 클래스 > 객체 생성
		User u1 = new User.Builder()
				 		  .setSeq(53L)
				 		  .setName("카피바라")
				 		  .setAge(394)
				 		  .setAddress("여기저기")
				 		  .setGender("m")
				 		  .build()
				 		  ;
		
		//User [seq=53, name=카피바라, age=394, address=여기저기, gender=m]
		System.out.println(u1);
		
		User u2 = new User.Builder()
						  .setName("옥수수")
						  .setAge(1)
						  .setAddress("미국")
						  .setGender("f")
						  .build()
						  ;
		
		System.out.println(u2);
		
		User u3 = new User.Builder()
						  .setSeq(53L)
						  .setGender("m")
						  .build();
						  
		System.out.println(u3);
		
		Guest g1 = new Guest.Builder()
				            .name("메뚜기")
				            .age(43)
				            .gender("m")
				            .address("서울시")
				            .build();
		
		System.out.println(g1);
		
		
	}
	
}

class Guest {
	
	private Long seq;
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	private Guest(Builder builder) {
		this.seq = builder.seq;
		this.name = builder.name;
		this.age = builder.age;
		this.address = builder.address;
		this.gender = builder.gender;
	}

	//중첩 클래스 
	public static class Builder {
		
		private Long seq;
		private String name;
		private Integer age;
		private String address;
		private String gender;
		
		public Builder seq(Long seq) {
			this.seq = seq;
			return this;
		}
		public Builder name(String name) {
			this.name = name;
			return this;
		}
		public Builder age(Integer age) {
			this.age = age;
			return this;
		}
		public Builder address(String address) {
			this.address = address;
			return this;
		}
		public Builder gender(String gender) {
			this.gender = gender;
			return this;
		}
		
		public Guest build() {
			return new Guest(this);
		}
	}

	@Override
	public String toString() {
		return "Guest [seq=" + seq + ", name=" + name + ", age=" + age + ", address=" + address + ", gender=" + gender
				+ "]";
	}
	
}

class User {
	
	private Long seq;
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	private User(Builder builder) {
		this.seq = builder.seq;
		this.name = builder.name;
		this.age = builder.age;
		this.address = builder.address;
		this.gender = builder.gender;
	}

	//중첩 클래스 
	public static class Builder {
		
		private Long seq;
		private String name;
		private Integer age;
		private String address;
		private String gender;
		
		public Builder setSeq(Long seq) {
			this.seq = seq;
			return this;
		}
		public Builder setName(String name) {
			this.name = name;
			return this;
		}
		public Builder setAge(Integer age) {
			this.age = age;
			return this;
		}
		public Builder setAddress(String address) {
			this.address = address;
			return this;
		}
		public Builder setGender(String gender) {
			this.gender = gender;
			return this;
		}
		
		public User build() {
			return new User(this);
		}
	}

	@Override
	public String toString() {
		return "User [seq=" + seq + ", name=" + name + ", age=" + age + ", address=" + address + ", gender=" + gender
				+ "]";
	}
	
}

class Member {
	
	private Long seq;
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	public Member(Long seq, String name, Integer age, String address, String gender) {
		super();
		this.seq = seq;
		this.name = name;
		this.age = age;
		this.address = address;
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Member [seq=" + seq + ", name=" + name + ", age=" + age + ", address=" + address + ", gender=" + gender
				+ "]";
	}
}