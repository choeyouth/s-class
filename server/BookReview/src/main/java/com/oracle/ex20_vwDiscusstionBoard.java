package com.oracle;

public class ex20_vwDiscusstionBoard {

	public static void main(String[] args) {

		BasicInfo db = new BasicInfo();
		
		// JOIN
		// 각 테이블의 시퀀스 번호가 필요할 듯함
		String joinQuery = "SELECT d.seq, d.title, d.content, "
								+ "d.postdate, d.bookTitle, d.author, "
								+ "d.reply, d.commitDate, d.id AS postId, m.id AS replyId, d.replySeq "
							+ "FROM vwDiscussion d "
							+ "LEFT JOIN tblMember m ON d.replyMember_seq = m.seq";
		
	
		// 뷰 생성
		db.createView("vwDiscussionBoard", joinQuery);
		
	}

}
