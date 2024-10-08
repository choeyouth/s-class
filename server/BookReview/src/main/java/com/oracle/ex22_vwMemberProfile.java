package com.oracle;

public class ex22_vwMemberProfile {

	public static void main(String[] args) {

		BasicInfo db = new BasicInfo();
		
		// JOIN
		// 각 테이블의 시퀀스 번호가 필요할 듯함
		String joinQuery = "SELECT m.seq, m.id, m.password, mi.name, mi.tel, mi.email, mi.address "
							+ "FROM tblMember m JOIN tblMemberInfo mi "
							+ "ON m.seq = mi.member_seq";
		
	
		// 뷰 생성
		db.createView("vwMemberProfile", joinQuery);
		
	}

}
