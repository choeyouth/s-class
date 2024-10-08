package com.test.java.obj;

// 직원, 사원
public class Employee {

	private String name; 		// 직원명
	private String department;  // 부서명
	
	private Employee boss;	    // 직속상사

	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Employee getBoss() {
		return boss;
	}

	public void setBoss(Employee boss) {
		this.boss = boss;
	}
	
}
