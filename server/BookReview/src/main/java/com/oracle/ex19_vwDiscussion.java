package com.oracle;

public class ex19_vwDiscussion {

	public static void main(String[] args) {

		BasicInfo db = new BasicInfo();
		
		// JOIN
		// 각 테이블의 시퀀스 번호가 필요할 듯함
		String joinQuery = "SELECT db.seq AS seq, db.title AS title, db.content AS content, "
								+ "db.postdate AS postdate, b.name AS bookTitle, b.author AS author, "
								+ "dr.reply AS reply, m.id, dr.member_seq AS replyMember_seq, dr.commitDate, dr.seq AS replySeq "
							+ "FROM tblDiscussionBoard db "
							+ "JOIN tblBook b ON b.seq = db.book_seq "
							+ "LEFT JOIN tblDiscussionReply dr ON db.seq = dr.discussionBoard_seq "
							+ "JOIN tblMember m ON db.member_seq = m.seq";
		
	
		// 뷰 생성
		db.createView("vwDiscussion", joinQuery);
		
	}

}
