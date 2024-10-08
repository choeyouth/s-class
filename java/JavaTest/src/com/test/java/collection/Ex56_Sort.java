package com.test.java.collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;

public class Ex56_Sort {

	public static void main(String[] args) {
		
		/*
		
			정렬
			- 배열 or 컬렉션(List)
			- 순서가 있는 집합 > 정렬 가능
			
			1. 직접 정렬 > 정렬 알고리즘
			2. JDK제공 > Arrays.sort()
			
		*/
		
		//m1(); // 오름차순 정렬
		//m2(); //내림차순 정렬
		//m3(); //익명객체 활용
		//m4(); //객체 배열
		//m5(); //학생 객체
		m6(); //직원 객체
		
	}//main

	private static void m6() {
		
		ArrayList<Employee> list = new ArrayList<>();
		
		list.add(new Employee("홍길동", "부장"));
		list.add(new Employee("아무개", "사원"));
		list.add(new Employee("강아지", "대리"));
		list.add(new Employee("고양이", "과장"));
		list.add(new Employee("병아리", "사원"));
		
//		Collections.sort(list, new Comparator<Employee>() {
//
//			@Override
//			public int compare(Employee o1, Employee o2) {
//				//return o1.getName().compareTo(o2.getName());
//				//return o1.getPosition().compareTo(o2.getPosition()); // ㄱㄴㄷㄹ 순
//				return getPositionNumber(o2.getPosition()) 
//						- getPositionNumber(o1.getPosition());
//			
//			}
//		});

		// comparator을 만드는 
		list.sort(new Comparator<Employee>() {

			@Override
			public int compare(Employee o1, Employee o2) {
				
				return o1.getName().compareTo(o2.getName());
			}
			
		});
		
		System.out.println(list);
		
	}
	private static int getPositionNumber(String position) {
		
		if(position.equals("부장")) {
			return 4;
		} else if (position.equals("과장")) {
			return 3;
		} else if (position.equals("대리")) {
			return 2;
		} else if (position.equals("사원")) {
			return 1;
		} 
		
		return 0; // 모든 경우의 수의 리턴값이 필요함 > 컴파일러 입장에서 리턴값
		
	}

	private static void m5() {

		Student2[] list = new Student2[5];
		
		list[0] = new Student2("홍길동", 100, 90, 80);
		list[1] = new Student2("아무개", 96, 76, 86);
		list[2] = new Student2("강아지", 98, 68, 57);
		list[3] = new Student2("고양이", 67, 86, 86);
		list[4] = new Student2("병아리", 95, 96, 56);
		
		Arrays.sort(list, new Comparator<Student2>() {

			@Override
			public int compare(Student2 o1, Student2 o2) {
			
				return (o1.getKor() + o1.getEng() + o1.getMath()) 
						- (o2.getKor() + o2.getEng() + o2.getMath());
			}
			
		});
		
		System.out.println(Arrays.toString(list));
		
	}

	private static void m4() {

		//객체 배열
		
		User[] list = new User[5];
		
		list[0] = new User("홍길동", 20, 180, 70);
		list[1] = new User("아무개", 25, 180, 65);
		list[2] = new User("강아지", 23, 180, 75);
		list[3] = new User("고양이", 24, 185, 80);
		list[4] = new User("병아리", 22, 190, 60);
		
		System.out.println(Arrays.toString(list));
		
		Arrays.sort(list, new Comparator<User>() {

			@Override
			public int compare(User o1, User o2) {
				
				//System.out.println(o1.getAge() + "," + o2.getAge());
				
				//return o1.getAge() - o2.getAge(); //판단 기준이 나이 > 오름차순
				//return o2.getAge() - o1.getAge(); //판단 기준이 나이 > 내림차순
				//return o1.getHeight() - o2.getHeight(); //판단 기준 키
				//return o1.getWeight() - o2.getWeight(); // 판단 기준 몸무게
				//return o1.getName().compareTo(o2.getName()); //문자열 정렬 - 판단 기준 이름 
			
				//return o1.getHeight() - o2.getHeight(); //판단 기준 키
			
				if(o1.getHeight() > o2.getHeight()) {
					return 1;
				} else if(o1.getHeight() <o2.getHeight()) {
					return -1;
				} else {
					
					// 둘이 키가 같으면 > 다시 몸무게로 비교
					if(o1.getWeight() > o2.getWeight()) {
						return 1;
					} else if(o1.getWeight() < o2.getWeight()) {
						return -1;
					} else {
						return 0;
					}
					
				}
				
			}
			
		});

		System.out.println(Arrays.toString(list));
		
		
		
		
	}

	private static void m3() {
		
		Integer[] nums1 = {1, 5, 2, 4, 3};
		
		//Arrays.sort(nums1, 컴페어레이터구현한 객체));
		
//		Comparator<Integer> c1 = new Comparator<Integer>() {
//
//			@Override
//			public int compare(Integer o1, Integer o2) {
//
//				return o2 - o1; // 내림차순 , 오름차순 : o1 - o2
//			
//			}
//			
//		};
//		
//		Arrays.sort(nums1, c1);
		
		// 익명 객체 > 1회성으로 요구되는 인터페이스 객체를 사용할 때
		Arrays.sort(nums1, new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {

				return o2 - o1; // 내림차순 , 오름차순 : o1 - o2
			
			}
			
		});
		
		System.out.println(Arrays.toString(nums1));
		
		
	}

	private static void m2() {
		
		
		Integer[] nums1 = {1, 5, 2, 4, 3};
		System.out.println(Arrays.toString(nums1));
		
		// Arrays.sort(nums1); //오름차순
		
		MyComparator c1 = new MyComparator();
		
		Arrays.sort(nums1, c1);
		
		System.out.println(Arrays.toString(nums1));
		
		
		
		
		
	}

	private static void m1() {

		//정렬 대상
		//1. 숫자
		//2. 문자(열)
		//3. 날짜/시간
		
		//1.A 숫자 + 배열
		int[] nums1 = {1, 5, 2, 4, 3};
		System.out.println(Arrays.toString(nums1));
		
		//오름차순
		Arrays.sort(nums1);
		
		System.out.println(Arrays.toString(nums1));
		System.out.println();

		
		//2.A 숫자 + List
		
		ArrayList<Integer> nums2 = new ArrayList<Integer>();
		
		nums2.add(1);
		nums2.add(5);
		nums2.add(2);
		nums2.add(4);
		nums2.add(3);
		
		System.out.println(nums2);
		
		//오름차순 
		Collections.sort(nums2);
		System.out.println(nums2);
		System.out.println();
		
		
		
		
		//2. 문자열 
		String[] names1 = { "홍길동", "강아지", "아무개", "고양이", "병아리" };
		
		Arrays.sort(names1);
		System.out.println(Arrays.toString(names1)); //[강아지, 고양이, 병아리, 아무개, 홍길동]
		System.out.println();
		
		String s1 = "홍길동";
		String s2 = "아무개";
		
		System.out.println(s1.compareTo(s2)); //양수, 0, 음수 
		// 양수: 앞에 변수가 더 크면
		// 음수: 앞에 변수가 더 작으면
		// 0: 두 변수가 같으면
		
		ArrayList<String> names2 = new ArrayList<>();
		
		names2.add("홍길동");
		names2.add("강아지");
		names2.add("아무개");
		names2.add("고양이");
		names2.add("병아리");
		
		System.out.println(names2);
		Collections.sort(names2);
		System.out.println(names2);
		System.out.println();
		
		
		//3. 날짜/시간
		Calendar[] clist = new Calendar[5];
		
		//System.out.println(Arrays.toString(clist));
		
		clist[0] = Calendar.getInstance();
		clist[0].add(Calendar.DATE, -5);
		
		clist[1] = Calendar.getInstance();
		clist[1].add(Calendar.DATE, 3);
		
		clist[2] = Calendar.getInstance();
		clist[2].add(Calendar.DATE, -2);
		
		clist[3] = Calendar.getInstance();
		clist[3].add(Calendar.DATE, 7);
		
		clist[4] = Calendar.getInstance();
		
		//System.out.println(Arrays.toString(clist));
		
		for(Calendar c : clist) {
			System.out.printf("%tF\n", c);
		}
		System.out.println();
		
		
		Arrays.sort(clist);
		
		for(Calendar c : clist) {
			System.out.printf("%tF\n", c);
		}
		System.out.println();
		
		//- 날짜/시간 - ArrayList버전
		
		ArrayList<Calendar> clist2 = new ArrayList<Calendar>();
		
		clist2.add(Calendar.getInstance());
		clist2.get(0).add(Calendar.DATE, -5);
		
		clist2.add(Calendar.getInstance());
		clist2.get(1).add(Calendar.DATE, 3);
		
		clist2.add(Calendar.getInstance());
		clist2.get(2).add(Calendar.DATE, -2);
		
		clist2.add(Calendar.getInstance());
		clist2.get(3).add(Calendar.DATE, 7);
		
		clist2.add(Calendar.getInstance());
		
		for (Calendar c : clist2) {
			System.out.printf("%tF\n", c);
		}
		System.out.println();
		
		Collections.sort(clist2);
		
		for (Calendar c : clist2) {
			System.out.printf("%tF\n", c);
		}
		System.out.println();
		
		
	}//m1

}//class

class MyComparator implements Comparator<Integer> {

	@Override
	public int compare(Integer o1, Integer o2) {
		
		//o1과 o2 중 누가 더 큰지? 더 작은지?
		// return 값 : 양수, 음수, 0 

		return o2 - o1;
		
//		if(o1>o2) {
//			return -1;
//		} else if(o1<o2) {
//			return 1;
//		} else {
//			return 0;
//		}
		
	}
}

class User {
	
	private String name;
	private int age;
	private int height;
	private int weight;
	
	
	
	public User(String name, int age, int height, int weight) {
		
		this.name = name;
		this.age = age;
		this.height = height;
		this.weight = weight;
		
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getAge() {
		return age;
	}



	public void setAge(int age) {
		this.age = age;
	}



	public int getHeight() {
		return height;
	}



	public void setHeight(int height) {
		this.height = height;
	}



	public int getWeight() {
		return weight;
	}



	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	@Override
	public String toString() {

		
		
		return String.format("\n%s(%d세) %dcm %dkg\n"
							, this.name
							, this.age
							, this.height
							, this.weight);
	}
	
}

class Student2 {
	
	private String name;
	private int kor;
	private int eng;
	private int math;
	
	
	public Student2(String name, int kor, int eng, int math) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.math = math;
	}


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
		return "Student2 [name=" + name + ", kor=" + kor 
				+ ", eng=" + eng + ", math=" + math + "]";
	}
}


class Employee {
	
	private String name;
	private String position; //직급(부장, 과장, 대리, 사원)
	
	public Employee(String name, String position) {
		super();
		this.name = name;
		this.position = position;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "Employee [name=" + name + ", position=" + position + "]";
	}
	
	
}


















