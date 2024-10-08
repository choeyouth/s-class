package com.test.question;

public class Employee {
	

	private String name;
	private String department;
	private String position;
	private String tel;
	private Employee boss;

	// getter, setter 구현

	public String getName() {
		return name;
	}

	public void setName(String name) {
		
		if (name.length() < 2 || name.length() > 5) {
			return;
		}
		
		for (int i=0; i<name.length(); i++) {
			char c = name.charAt(i);
			
			if (c < '가' || c > '힣') {
				return;
			}
		}
		
		
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		
		if (!(department.equals("영업부")
		 || department.equals("기획부")
		 || department.equals("총무부")
		 || department.equals("개발부")
		 || department.equals("홍보부"))) {
			return;
		}
		
		this.department = department;
	}

	public String getPosition() {
		return position;
	}
	
	
	public void setPosition(String position) {
		
		if (!(position.equals("부장")
		   || position.equals("과장")
		   || position.equals("대리")
		   || position.equals("사원"))) {
			
			return;
			
		}
		
		this.position = position;
	}

	public String getTel() {
		return tel;
	}
	
	//010-XXXX-XXXX 형식 확인
	public void setTel(String tel) {
		
		if (!(tel.substring(3, 4).equals("-") && tel.substring(8, 9).equals("-"))) {
			return;
		}
		
		this.tel = tel;
	}

	public Employee getBoss() {
		return boss;
	}

	// 다른 직원 중 한명, 같은 부서가 아니면 될 수 없음(유효성 검사)
	public void setBoss(Employee boss) {
		
		if (boss == null) {
			return;
		}
		
		if (!(boss.getDepartment().equals(department))) {
			return;
		} 
		
		this.boss = boss;
	}

	public void info() {
		
		if (this.boss != null) {
			
			System.out.printf("[%s]\r\n"
					+ "- 부서: %s\r\n"
					+ "- 직위: %s\r\n"
					+ "- 연락처: %s\r\n"
					+ "- 직속상사: %s\r\n"
					, this.name
					, this.department
					, this.position
					, this.tel
					, this.boss.name);
			
		} else {
			
			System.out.printf("[%s]\r\n"
					+ "- 부서: %s\r\n"
					+ "- 직위: %s\r\n"
					+ "- 연락처: %s\r\n"
					+ "- 직속상사: 없음\r\n\n"
					, this.name
					, this.department
					, this.position
					, this.tel);
			
		}
		
		

	}
	
}
