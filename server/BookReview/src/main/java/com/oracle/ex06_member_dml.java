package com.oracle;

public class ex06_member_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();
        
        
        
        String[] insertQueries = {
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'user123', '8k^Zx!7r@Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'alice42', 'p@4!Rz^8Lk')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'bob56', 'Q7$h*2%Wm@')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'carol78', '!L3#v^6A@Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'dave90', 'T5@!k#Z2^R')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'eve34', 'X@9#y$L8^A')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'frank21', 'R3*e@8!K^p')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'grace67', '!T4$#n^9Qk')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'hank89', 'A2^!L#5@Wz')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'ida43', '#9$R^6!qT')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'jack56', 'Z@8^!r#3Lk')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'karen98', 'T3^@7!l#Q2')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'leo67', 'P8!$Q@5^kL')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'mia34', 'R6#@!9^T2')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'nick21', 'L@8^2!Q#R')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'olivia87', '!T^5@Q3#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'paul92', 'R#8@6^!L2')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'quinn75', '@2!T^#9Lk')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'rachel84', 'Q6^@8!L#3')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'sam64', 'L@5!^T2#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'tina91', '!8^R#2@Lk')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'ursula33', 'Q7!$T^2@L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'victor82', '@5!L^2#Q6')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'wade56', 'T^8!Q#2@L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'xena34', '!L@2^Q#5')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'yara45', 'R3!^8#L@Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'zane67', 'L@2!Q^5#T')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'amy89', 'Q6^@!2#T')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'brian34', '@T5!^L#2')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'claire56', 'L@2^!T#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'derek78', 'T^@6!Q#2L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'ella90', 'Q@8^!L#2')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'finn43', '!2^L#Q@6')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'gina67', 'R8!^@2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'hugo89', 'L@2^5!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'irene34', 'T^6!@Q#2')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'jackson56', '@L2^!5#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'kylie78', 'Q6@2^!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'liam90', 'L@5!^2#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'monica43', 'T^8!@2#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'nate56', 'Q@2^5!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'olga78', 'L@6^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'paul89', 'T^5!Q@2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'quincy90', 'L@2^!Q#5')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'rosa43', 'Q6!^@2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'simon56', 'L@8^!2#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'tessa78', 'T^2!@Q#5')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'ursula89', '@L5^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'vince90', 'Q@2!^5#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'wendy43', 'L8!^@2#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'xander56', 'T^5!L@2#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'yvonne78', 'Q@2^!5#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'zach89', 'L@6^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'anna90', 'T^2!@5#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'billy43', 'Q@8^!2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'cathy56', 'L@2^!5#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'daniel78', 'T^6!@Q#2')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'emily89', 'Q@2^5!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'fred90', 'L@8^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'gwen43', 'T^2!@5#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'hannah56', 'Q@5!^2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'ian78', 'L@6^!2#Q')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'julia89', 'T^8!@2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'kevin90', 'Q@2^5!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'lisa43', 'L@5^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'mark56', 'T^2!@8#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'nora78', 'Q@2^!5#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'oliver89', 'L@6^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'pam90', 'T^5!@2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'quinn43', 'Q@2^8!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'rory56', 'L@5^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'sara78', 'T^2!@8#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'tyler89', 'Q@2^5!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'uma90', 'L@6^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'vera43', 'T^5!@2#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'will56', 'Q@2^8!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'xena78', 'L@5^2!Q#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'yale89', 'T^2!@6#L')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'zane90', 'Q@2^5!L#')",
        	    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'hwang00', 'J^9!s@3#R')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'kim01', 'P!5@L^8#K')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'lee02', 'N2^@R!7#L')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'park03', 'A!6^T@2#Q')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'choi04', 'R@5!L^3#T')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'jung05', 'L^2@Q!7#T')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'seo06', 'Q@8^R!5#L')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'yoo07', 'T^3!@L#6R')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'lim08', 'L@7^T!2#Q')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'kwon09', 'R!4^@2#L')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'jeong10', 'Q^5!@L#3T')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'son11', 'T@2^L!7#R')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'oh12', 'L^9!Q@5#T')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'kim13', 'R@6^T!3#L')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'lee14', 'T^7!@L#2Q')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'park15', 'L@4^Q!5#T')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'choi16', 'Q!8^@2#L')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'jung17', 'R^3!@L#6T')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'seo18', 'L@2^T!5#Q')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'yoo19', 'T!4^Q@6#L')",
			    "INSERT INTO tblMember (seq, id, password) VALUES (tblMember_seq.NEXTVAL, 'lim20', 'L^8!@2#Q')"
        	};
        	
	        // 배치 처리로 여러 데이터 삽입
        	dbHelper.insertDataBatch(insertQueries);
        
        
        	

        
    }
}


