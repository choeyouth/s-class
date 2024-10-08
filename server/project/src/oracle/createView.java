package com.oracle;

public class createView {

	public static void main(String[] args) {

		BasicInfo db = new BasicInfo();
		
		// JOIN
		String joinQuery = "SELECT m.seq, m.id, m.password, mi.name, mi.address, mi.tel, mi.email " + 
						   "FROM tblMember m " +
						   "JOIN tblMemberInfo mi ON m.seq = mi.member_seq";
		
	
		// 뷰 생성
		db.createView("vwMemberProfile", joinQuery);
		
	}

}
