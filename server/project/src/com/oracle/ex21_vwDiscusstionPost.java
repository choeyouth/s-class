package com.oracle;

public class ex21_vwDiscusstionPost {

	public static void main(String[] args) {

		BasicInfo db = new BasicInfo();
		
		// JOIN
		// 각 테이블의 시퀀스 번호가 필요할 듯함
		String joinQuery = "SELECT d.seq, d.title, d.content, "
								+ "d.postdate, d.bookTitle, d.author, d.postId, d.reply "
							+ "FROM vwDiscussionBoard d ";
		
	
		// 뷰 생성
		db.createView("vwDiscussionPost", joinQuery);
		
	}

}
