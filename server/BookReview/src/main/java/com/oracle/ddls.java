package com.oracle;

public class ddls {

	public static void main(String[] args) {
		
		// SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo dbHelper = new BasicInfo();

        // 장르 리스트 테이블 생성
        String createTableQuery = "CREATE TABLE tblGenreList ("
                                + "seq NUMBER PRIMARY KEY, "
                                + "genre VARCHAR2(100) NOT NULL)";
        
        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
	    // 서브 장르 리스트 테이블 생성
	    createTableQuery = "CREATE TABLE tblSubGenre ("
	                            + "seq NUMBER PRIMARY KEY, "
	                            + "genre_seq NUMBER NOT NULL, "
	                            + "subGenre VARCHAR2(100) NOT NULL, "
	                            + "FOREIGN KEY (genre_seq) REFERENCES tblGenreList(seq)"
	                            + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
        // 도서 테이블 생성 SQL 쿼리
        createTableQuery = "CREATE TABLE tblBook ("
                                + "seq NUMBER PRIMARY KEY, "
                                + "subGenre_seq NUMBER NOT NULL, "
                                + "name VARCHAR2(200) NOT NULL, "
                                + "author VARCHAR2(1000) NOT NULL, "
                                + "publicationDate DATE NOT NULL, "
                                + "story VARCHAR2(4000) NULL, "
                                + "cover VARCHAR2(500) NOT NULL, "
                                + "FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq)"
                                + ")";

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
        // 관리자 테이블 생성 SQL 쿼리
        createTableQuery = "CREATE TABLE tblManager ("
                                + "seq NUMBER PRIMARY KEY, "
                                + "id VARCHAR2(20) NOT NULL, "
                                + "password VARCHAR2(20) NOT NULL)";

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
        // 관리자 시퀀스 생성 SQL 쿼리
        String createSequenceQuery = "CREATE SEQUENCE manager_seq "
                                   + "START WITH 1 "
                                   + "INCREMENT BY 1";

        // 관리자 시퀀스 생성 메서드 호출
        dbHelper.createSequence(createSequenceQuery);
        
        // 회원 테이블 생성 SQL 쿼리
        createTableQuery = "CREATE TABLE tblMember ("
                                + "seq NUMBER PRIMARY KEY, "
                                + "id VARCHAR2(20) NOT NULL, "
                                + "password VARCHAR2(20) NOT NULL)";

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
        // 회원 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE tblMember_seq "
                                   + "START WITH 1 "
                                   + "INCREMENT BY 1";

        // 시퀀스 생성 메서드 호출
        dbHelper.createSequence(createSequenceQuery);
        
        // 회원 개인 정보 테이블 생성 SQL 쿼리
        createTableQuery = "CREATE TABLE tblMemberInfo ("
                + "seq NUMBER PRIMARY KEY, "
                + "member_seq NUMBER NOT NULL, "
                + "name VARCHAR2(20) NOT NULL, "
                + "address VARCHAR2(2000) NOT NULL, "
                + "tel VARCHAR2(20) NOT NULL, "
                + "email VARCHAR2(200) NOT NULL, "
                + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
                + ")";

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        // 회원 개인 정보 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE memberInfo_seq "
                                   + "START WITH 1 "
                                   + "INCREMENT BY 1";

        // 시퀀스 생성 메서드 호출
        dbHelper.createSequence(createSequenceQuery);
        
        
        // 토론 게시판 테이블 생성 SQL 쿼리
        createTableQuery = "CREATE TABLE tblDiscussionBoard ("
                + "seq NUMBER PRIMARY KEY, "
                + "book_seq NUMBER NOT NULL, "
                + "member_seq NUMBER NOT NULL, "
                + "title VARCHAR2(100) NOT NULL, "
                + "content VARCHAR2(4000) NOT NULL, "
                + "postDate DATE NOT NULL, "
                + "FOREIGN KEY (book_seq) REFERENCES tblBook(seq), "
                + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
                + ")";
        

        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);

        
        // 토론 게시판 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE discussionBoard_seq "
                                   + "START WITH 1 "
                                   + "INCREMENT BY 1";

        // 시퀀스 생성 메서드 호출
        dbHelper.createSequence(createSequenceQuery);
        
        
    	// 토론 댓글 테이블 생성 SQL 쿼리
    	createTableQuery = "CREATE TABLE tblDiscussionReply ("
    	        + "seq NUMBER PRIMARY KEY, "
    	        + "discussionBoard_seq NUMBER NOT NULL, "
    	        + "member_seq NUMBER NOT NULL, "
    	        + "reply VARCHAR2(1000) NOT NULL, "
    	        + "commitDate DATE NOT NULL, "
    	        + "FOREIGN KEY (discussionBoard_seq) REFERENCES tblDiscussionBoard(seq), "
    	        + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
    	        + ")";

        
        // 테이블 생성 메서드 호출
        dbHelper.createTable(createTableQuery);
        
        
        // 토론 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE discussionReply_seq "
                                   + "START WITH 1 "
                                   + "INCREMENT BY 1";

        // 시퀀스 생성 메서드 호출
        dbHelper.createSequence(createSequenceQuery);
        
        
        
	    // 도서 리뷰 테이블 생성 SQL 쿼리
        createTableQuery = "CREATE TABLE tblBookReview ("
			    		+ " seq NUMBER(10) PRIMARY KEY,"
			    		+ " book_seq NUMBER(14) NOT NULL,"
			    		+ " commend VARCHAR2(1000) NOT NULL,"
			    		+ " member_seq NUMBER NOT NULL,"
			    		+ " review_date DATE DEFAULT sysdate NOT NULL,"
			    		+ " FOREIGN KEY (book_seq) REFERENCES tblBook(seq),"
			    		+ " FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
			    		+ ");";
	    
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 도서 리뷰 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE bookreview_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);

		
	    // 평점 테이블 생성 SQL 쿼리
	    createTableQuery = "CREATE TABLE tblRank ("
			    		+ " seq NUMBER PRIMARY KEY,"
			    		+ " book_seq NUMBER NOT NULL,"
			    		+ " member_seq NUMBER NOT NULL,"
			    		+ " score NUMBER NOT NULL,"
			    		+ " rankDate DATE DEFAULT sysdate NOT NULL,"
			    		+ " FOREIGN KEY (book_seq) REFERENCES tblBook(seq),"
			    		+ " FOREIGN KEY (member_seq) REFERENCES tblMember(seq)"
			    		+ ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 평점 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE rank_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		
		
		
	    // 선호도 테이블 생성 SQL 쿼리
	    createTableQuery = "CREATE TABLE tblPreference ("
	                            + "seq NUMBER PRIMARY KEY, "
	                            + "member_seq NUMBER NOT NULL, "
	                            + "subGenre_seq NUMBER NOT NULL, "
	                            + "targetRead NUMBER NOT NULL, "
	                            + "FOREIGN KEY (member_seq) REFERENCES tblMember(seq), "
	                            + "FOREIGN KEY (subGenre_seq) REFERENCES tblSubGenre(seq)"
	                            + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 선호도 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE preference_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
        
		
		
	    // 단어 목록 테이블 생성 SQL 쿼리
		createTableQuery = "CREATE TABLE tblWordList ("
                + "target_code NUMBER PRIMARY KEY, "   
                + "word VARCHAR(200) NOT NULL, "       
                + "pos VARCHAR(200) NOT NULL, "       
                + "definition VARCHAR2(1000) NOT NULL"
                + ")";

	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 명언 테이블 생성 SQL 쿼리
		createTableQuery = "CREATE TABLE tblQuoteList ("
		        + "seq NUMBER PRIMARY KEY, "
		        + "quote VARCHAR2(4000) NOT NULL, "
		        + "author VARCHAR2(1000) NOT NULL"
		        + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    

	    // 명언 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE quote_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);
		
		
	    // 명대사 테이블 생성 SQL 쿼리
		createTableQuery = "CREATE TABLE tblFamousLine ("
		        + "seq NUMBER PRIMARY KEY, "
		        + "book_seq NUMBER NOT NULL, "
		        + "famousline VARCHAR2(4000) NOT NULL,"
		        + "CONSTRAINT fk_book_seq FOREIGN KEY (book_seq) REFERENCES tblBook(seq)"
		        + ")";
	
	    // 테이블 생성 메서드 호출
	    dbHelper.createTable(createTableQuery);
	    
	    
	    // 명대사 시퀀스 생성 SQL 쿼리
        createSequenceQuery = "CREATE SEQUENCE famousline_seq "
                + "START WITH 1 "
                + "INCREMENT BY 1";

		// 시퀀스 생성 메서드 호출
		dbHelper.createSequence(createSequenceQuery);

		
	}
}
