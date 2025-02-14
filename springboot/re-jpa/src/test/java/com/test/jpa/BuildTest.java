package com.test.jpa;

import org.junit.jupiter.api.Test;


public class BuildTest {

	@Test
	void test() {

		//첫 번째 방법 
		//Address 클래스  > 사용
		Member m1 = new Member(null, "꿀꿀쓰", 3, "서울특별시 강남구 역삼동 한독빌딩", "f");
		
		//Member [seq=null, name=꿀꿀쓰, age=3, address=서울특별시 강남구 역삼동 한독빌딩, gender=f]
		System.out.println(m1);
		
		//두 번째 방법 
		User u1 = new User.Builder()
						  .setSeq(55L)
						  .setName("카휘바라")
						  .setAge(535)
						  .setAddress("늪")
						  .setGender("f")
						  .build();
		
		//User [seq=55, name=카휘바라, age=535, address=늪, gender=f] 
		System.out.println(u1);
		
		//장점 1. 
		//생성자를 사용한 객체 생성의 단점 > 초기화하고 싶지 않은 멤버 
		//> User 클래스로 사용하여 해결
		User u2 = new User.Builder()
						  .setName("옥수수")
						  .setAge(1)
						  .setAddress("미국")
						  .setGender("f")
						  .build();
		
		//장점 2. 
		//집어 넣어야 할 매개변수 확인 가능
		//메서드이기 때문에 순서 상관 없음
		// => 개발자가 덜 기억해도 됨 
		
		//User [seq=null, name=옥수수, age=1, address=미국, gender=f]
		System.out.println(u2);
		

		//세 번째 방법
		Guest g1 = new Guest.Builder()
						    .name("메뚜기")
						    .age(30)
						    .gender("m")
						    .address("미국에엄청난메뚜기떼가")
						    .build();
		
		//Guest [seq=null, name=메뚜기, age=null, address=미국에엄청난메뚜기떼가, gender=m]
		System.out.println(g1);
		
		
		//JPA > Builder 패턴을 많이 사용함 
		
		
	}
	
	
	
}


//첫 번째 방법 
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
		return "Member [seq=" + seq + ", name=" + name + ", age=" + age + ", address=" + address + ", gender="
				+ gender + "]";
	}
	
}
//생성자를 사용한 객체 생성 단점
//1. 초기화를 하고 싶지 않은 멤버를 처리하기 불편
//null 혹은 기본값 대입 > 가독성 저하
//생성자 다양하게 오버로딩 > 개발자 비용 발생
//2. 매개변수의 개수 or 순서 > 가독성 저하


//두 번째 방법 
//-> 빌더 패턴 사용
//단점이 사라짐 but, 초기 비용 발생
//간단한 테스트 > 생성자 이용
class User {
	
	private Long seq;
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	private User(Builder builder) {
		
		this.seq = builder.seq;
		this.name = builder.name;
		this.address = builder.address;
		this.age = builder.age;
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

//세 번째 방법
class Guest {
	
	private Long seq;
	private String name;
	private Integer age;
	private String address;
	private String gender;
	
	private Guest(Builder builder) {
		this.seq = builder.seq;
		this.name = builder.name;
		this.address = builder.address;
		this.age = builder.age;
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
		
		public Builder age(Integer seq) {
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





