CREATE TABLE tblMember (
    seq NUMBER PRIMARY KEY,
    id VARCHAR2(20),
    password VARCHAR2(20) NOT NULL,
    ing NUMBER(1) DEFAULT 1 NOT NULL,
    lv NUMBER(1) DEFAULT 1 NOT NULL
);


CREATE TABLE tblMemberInfo (                         
    seq NUMBER PRIMARY KEY,                              
    member_seq NUMBER NOT NULL,                          
    name VARCHAR2(20) NOT NULL,                          
    address VARCHAR2(2000) NOT NULL,                
    addrDetail VARCHAR2(300) NOT NULL,
    zipcode VARCHAR2(10) NOT NULL,
    tel VARCHAR2(20) NOT NULL,                           
    email VARCHAR2(200) NOT NULL,            
    pic VARCHAR2(300) DEFAULT 'basic.png' NULL,
    regDate date DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (member_seq) REFERENCES tblMember(seq)   
);            


select * from tblMemberInfo order by seq;

create SEQUENCE memberInfo_seq;

-- 5. 회원
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 2, 'hong', '1111');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 2, 'tiger', '1111');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'amu', '1111');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'lion', '1111');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'user123', '8k^Zx!7r@Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'alice42', 'p@4!Rz^8Lk');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'bob56', 'Q7$h*2%Wm@');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'carol78', '!L3#v^6A@Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'dave90', 'T5@!k#Z2^R');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'eve34', 'X@9#y$L8^A');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'frank21', 'R3*e@8!K^p');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'grace67', '!T4$#n^9Qk');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'hank89', 'A2^!L#5@Wz');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'ida43', '#9$R^6!qT'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'jack56', 'Z@8^!r#3Lk');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'karen98', 'T3^@7!l#Q2');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'leo67', 'P8!$Q@5^kL');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'mia34', 'R6#@!9^T2'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'nick21', 'L@8^2!Q#R');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'olivia87', '!T^5@Q3#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'paul92', 'R#8@6^!L2');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'quinn75', '@2!T^#9Lk');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'rachel84', 'Q6^@8!L#3');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'sam64', 'L@5!^T2#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'tina91', '!8^R#2@Lk');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'ursula33', 'Q7!$T^2@L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'victor82', '@5!L^2#Q6');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'wade56', 'T^8!Q#2@L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'xena34', '!L@2^Q#5'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'yara45', 'R3!^8#L@Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'zane67', 'L@2!Q^5#T');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'amy89', 'Q6^@!2#T'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'brian34', '@T5!^L#2');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'claire56', 'L@2^!T#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'derek78', 'T^@6!Q#2L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'ella90', 'Q@8^!L#2');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'finn43', '!2^L#Q@6'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'gina67', 'R8!^@2#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'hugo89', 'L@2^5!Q#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'irene34', 'T^6!@Q#2');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'jackson56', '@L2^!5#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'kylie78', 'Q6@2^!L#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'liam90', 'L@5!^2#Q'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'monica43', 'T^8!@2#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'nate56', 'Q@2^5!L#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'olga78', 'L@6^2!Q#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'paul89', 'T^5!Q@2#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'quincy90', 'L@2^!Q#5');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'rosa43', 'Q6!^@2#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'simon56', 'L@8^!2#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'tessa78', 'T^2!@Q#5');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'ursula89', '@L5^2!Q#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'vince90', 'Q@2!^5#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'wendy43', 'L8!^@2#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'xander56', 'T^5!L@2#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'yvonne78', 'Q@2^!5#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'zach89', 'L@6^2!Q#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'anna90', 'T^2!@5#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'billy43', 'Q@8^!2#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'cathy56', 'L@2^!5#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'daniel78', 'T^6!@Q#2');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'emily89', 'Q@2^5!L#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'fred90', 'L@8^2!Q#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'gwen43', 'T^2!@5#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'hannah56', 'Q@5!^2#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'ian78', 'L@6^!2#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'julia89', 'T^8!@2#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'kevin90', 'Q@2^5!L#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'lisa43', 'L@5^2!Q#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'mark56', 'T^2!@8#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'nora78', 'Q@2^!5#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'oliver89', 'L@6^2!Q#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'pam90', 'T^5!@2#L');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'quinn43', 'Q@2^8!L#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'rory56', 'L@5^2!Q#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'sara78', 'T^2!@8#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'tyler89', 'Q@2^5!L#');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'uma90', 'L@6^2!Q#');  
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'vera43', 'T^5!@2#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'will56', 'Q@2^8!L#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'xena78', 'L@5^2!Q#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'yale89', 'T^2!@6#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'zane90', 'Q@2^5!L#'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'hwang00', 'J^9!s@3#R');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'kim01', 'P!5@L^8#K');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'lee02', 'N2^@R!7#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'park03', 'A!6^T@2#Q');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'choi04', 'R@5!L^3#T');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'jung05', 'L^2@Q!7#T');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'seo06', 'Q@8^R!5#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'yoo07', 'T^3!@L#6R'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'lim08', 'L@7^T!2#Q'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'kwon09', 'R!4^@2#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'jeong10', 'Q^5!@L#3T');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'son11', 'T@2^L!7#R');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'oh12', 'L^9!Q@5#T');  
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'kim13', 'R@6^T!3#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'lee14', 'T^7!@L#2Q'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'park15', 'L@4^Q!5#T');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'choi16', 'Q!8^@2#L'); 
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'jung17', 'R^3!@L#6T');
INSERT INTO tblMember (seq, ing, lv, id, password) VALUES (member_seq.NEXTVAL, DEFAULT, 1, 'seo18', 'L@2^T!5#Q'); 




-- 6. 회원 개인 정보
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 1,   '김철수', '010-0000-0001', '06700', '서울특별시 서초구 효령로4길 58', '(방배동,방현초등학교)', 'chulsoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 2,   '이영희', '010-0000-0002', '06078', '서울특별시 강남구 학동로 610', '(삼성동,봉은초등학교)', 'younghee@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 3,   '박진수', '010-0000-0003', '06097', '서울특별시 강남구 봉은사로63길 22', '(삼성동,삼릉초등학교)', 'jinsu@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 4,   '최지훈', '010-0000-0004', '06574', '서울특별시 서초구 방배로 260', '(방배동,서래초등학교)', 'jihoon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 5,   '정유진', '010-0000-0005', '06630', '서울특별시 서초구 서운로 35', '(서초동,서이초등학교)', 'yujin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 6,   '김서연', '010-0000-0006', '06723', '서울특별시 서초구 남부순환로339길 38', '(서초동,서일초등학교)', 'seoyeon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 7,   '이민호', '010-0000-0007', '06613', '서울특별시 서초구 서운로 178', '(서초동,서초초등학교)', 'minho@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 8,   '홍민지', '010-0000-0008', '06348', '서울특별시 강남구 광평로51길 46', '(수서동,수서초등학교)', 'minji@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 9,   '박성호', '010-0000-0009', '06029', '서울특별시 강남구 압구정로18길 28', '(신사동,신구초등학교)', 'seongho@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 10,  '김수진', '010-0000-0010', '06517', '서울특별시 서초구 나루터로 15', '(잠원동,신동초등학교)', 'sujin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 11,  '이경수', '010-0000-0011', '06712', '서울특별시 서초구 남부순환로317길 15', '(서초동,서울신중초등학교)', 'kyungsoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 12,  '최지영', '010-0000-0012', '06004', '서울특별시 강남구 압구정로39길 29', '(압구정동,압구정초등학교)', 'jiyoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 13,  '박지나', '010-0000-0013', '06755', '서울특별시 서초구 바우뫼로18길 14', '(양재동,양재초등학교)', 'jina@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 14,  '이보라', '010-0000-0014', '01438', '서울특별시 도봉구 노해로49길 69', '(쌍문동,한신초등학교)', 'bora@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 15,  '강태양', '010-0000-0015', '01797', '서울특별시 노원구 화랑로 621', '(공릉동,화랑초등학교)', 'taeyang@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 16,  '박상민', '010-0000-0016', '03746', '서울특별시 서대문구 경기대로9길 10', '(충정로2가,경기초등학교)', 'sangmin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 17,  '정은지', '010-0000-0017', '02806', '서울특별시 성북구 정릉로48길 52', '(돈암동,서울개운초등학교)', 'eunji@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 18,  '이성주', '010-0000-0018', '02723', '서울특별시 성북구 길음로 142', '(길음동,서울길음초등학교)', 'seongju@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 19,  '정유나', '010-0000-0019', '02830', '서울특별시 성북구 동소문로13길 38', '(동소문동6가,서울돈암초등학교)', 'yuna@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 20,  '이현우', '010-0000-0020', '02874', '서울특별시 성북구 보문사길 50', '(보문동3가,서울동신초등학교)', 'hyunwoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 21,  '한나리', '010-0000-0021', '02724', '서울특별시 성북구 삼양로 77', '(길음동, 서울미아초등학교)', 'nari@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 22,  '김지수', '010-0000-0022', '01187', '서울특별시 강북구 솔샘로 195', '(미아동,미양초등학교)', 'jisoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 23,  '정민제', '010-0000-0023', '01224', '서울특별시 강북구 오현로 204', '(번동,번동초등학교)', 'minje@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 24,  '이준',   '010-0000-0024', '01198', '서울특별시 강북구 삼양로19길 141', '(미아동,삼각산초등학교)', 'joon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 25,  '김소희', '010-0000-0025', '01181', '서울특별시 강북구 삼양로49길 17', '(미아동,삼양초등학교)', 'sohee@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 26,  '최현진', '010-0000-0026', '01085', '서울특별시 강북구 삼양로99길 36', '(수유동,서울우이초등학교)', 'hyunjin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 27,  '박지우', '010-0000-0027', '02747', '서울특별시 성북구 장월로3길 42', '(장위동,서울월곡초등학교)', 'jiwoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 28,  '강다영', '010-0000-0028', '01095', '서울특별시 강북구 인수봉로37길 24', '(수유동,서울유현초등학교)', 'daeyoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 29,  '이용호', '010-0000-0029', '01020', '서울특별시 강북구 인수봉로 269', '(수유동,서울인수초등학교)', 'yongho@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 30,  '최지영', '010-0000-0030', '02795', '서울특별시 성북구 월곡로 74', '(종암동,서울일신초등학교)', 'jiyoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 31,  '강태양', '010-0000-0031', '02754', '서울특별시 성북구 장월로23길 16', '(장위동,서울장곡초등학교)', 'taeyang@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 32,  '정수민', '010-0000-0032', '02769', '서울특별시 성북구 장월로8가길 41', '(장위동,서울장위초등학교)', 'sumin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 33,  '한선우', '010-0000-0033', '02826', '서울특별시 성북구 아리랑로 63', '(동소문동7가,서울정덕초등학교)', 'sunwoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 34,  '박수정', '010-0000-0034', '02701', '서울특별시 성북구 솔샘로25가길 8', '(정릉동,서울정릉초등학교)', 'soojung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 35,  '김소영', '010-0000-0035', '02813', '서울특별시 성북구 정릉로24길 58', '(정릉동,서울정수초등학교)', 'sooyoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 36,  '정민정', '010-0000-0036', '02706', '서울특별시 성북구 정릉로9라길 11', '(정릉동,서울청덕초등학교)', 'minjeong@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 37,  '이우진', '010-0000-0037', '48428', '부산광역시 남구 황령대로 343번길 9-55', '(대연동, 대남초등학교)', 'woojin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 38,  '한동우', '010-0000-0038', '48441', '부산광역시 남구 진남로18번길 11', '(대연동, 대연초등학교)', 'dongwoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 39,  '강세영', '010-0000-0039', '48529', '부산광역시 남구 조각공원로 19', '(대연동, 대천초등학교)', 'seyoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 40,  '정가영', '010-0000-0040', '48799', '부산광역시 동구 구봉로 46', '(수정동,동일중앙초등학교)', 'gayoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 41,  '이상현', '010-0000-0041', '46305', '부산광역시 금정구 동현로 36', '(부곡동, 동현초등학교)', 'sanghyun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 42,  '한지민', '010-0000-0042', '47767', '부산광역시 동래구 명장로63번길 60-5', '(명장동, 명동초등학교)', 'jimin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 43,  '정예린', '010-0000-0043', '47748', '부산광역시 동래구 동래로 91', '(명륜동,명륜초등학교)', 'yerin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 44,  '이준서', '010-0000-0044', '47760', '부산광역시 동래구 명서로 121', '(명장동, 명서초등학교)', 'junseo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 45,  '강지훈', '010-0000-0045', '47749', '부산광역시 동래구 복천로 121', '(명장동, 명장초등학교)', 'jihoon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 46,  '박해일', '010-0000-0046', '47826', '부산광역시 동래구 충렬대로100번길 83', '(온천동, 미남초등학교)', 'haeil@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 47,  '정성훈', '010-0000-0047', '46269', '부산광역시 금정구 기찰로22번길 15', '(부곡동, 부곡초등학교)', 'seonghoon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 48,  '이주환', '010-0000-0048', '47872', '부산광역시 동래구 쇠미로81번길 7', '(사직동, 사직초등학교)', 'jooheon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 49,  '한지영', '010-0000-0049', '42050', '대구광역시 수성구 국채보상로214길 33', '(만촌동,대구만촌초등학교)', 'jiyoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 50,  '정수연', '010-0000-0050', '42270', '대구광역시 수성구 달구벌대로647길 30', '(매호동,대구매호초등학교)', 'suyeon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 51,  '이상민', '010-0000-0051', '41968', '대구광역시 중구 남산로2길 125', '(남산동,명덕초등학교)', 'sangmin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 52,  '강은주', '010-0000-0052', '21362', '인천광역시 부평구 안남로253번길 41', '(산곡동, 인천부마초등학교)', 'eunju@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 53,  '박소진', '010-0000-0053', '21378', '인천광역시 부평구 원적로472번길 29', '(부평동, 인천부원초등학교)', 'sojin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 54,  '정다빈', '010-0000-0054', '21347', '인천광역시 부평구 부흥북로 175', '(부개동, 인천부일초등학교)', 'dabin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 55,  '이도현', '010-0000-0055', '21408', '인천광역시 부평구 경인로911번길 28', '(부평동, 인천부평남초등학교)', 'dohyun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 56,  '한정우', '010-0000-0056', '22729', '인천광역시 서구 승학로197번길 11', '(심곡동, 양지초등학교)', 'jeongwoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 57,  '정소리', '010-0000-0057', '21312', '인천광역시 부평구 세월천로30번길 58', '(청천동, 인천용마초등학교)', 'sori@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 58,  '이하준', '010-0000-0058', '21422', '인천광역시 부평구 항동로75번길 36', '(일신동, 인천일신초등학교)', 'hajun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 59,  '강하늘', '010-0000-0059', '21124', '인천광역시 계양구 까치말로 35', '(작전동, 인천작동초등학교)', 'haneul@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 60,  '박윤서', '010-0000-0060', '21084', '인천광역시 계양구 주부토로 456', '(작전동, 인천작전초등학교)', 'yunseo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 61,  '정희원', '010-0000-0061', '61969', '광주광역시 서구 상무오월로38번길 36', '(쌍촌동, 서광초등학교)', 'heewon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 62,  '이연수', '010-0000-0062', '62366', '광주광역시 광산구 사암로158번길 49', '(우산동,송우초등학교)', 'yeonsu@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 63,  '강한별', '010-0000-0063', '44912', '울산광역시 울주군 두서면 인보로 87', '(두서면, 두서초등학교)', 'hanbyeol@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 64,  '박미소', '010-0000-0064', '45012', '울산광역시 울주군 서생면 화산발리로 60', '(서생면, 명산초등학교)', 'miso@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 65,  '정진수', '010-0000-0065', '44932', '울산광역시 울주군 범서읍 장검1길 46', '(범서읍, 무거초등학교)', 'jinsu@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 66,  '이소연', '010-0000-0066', '17540', '경기도 안성시 대덕면 미륵로 16', '(대덕면,명덕초등학교)', 'sooyeon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 67,  '강수진', '010-0000-0067', '17558', '경기도 안성시 공도읍 서동대로 4424', '(공도읍,문기초등학교)', 'sujin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 68,  '정여진', '010-0000-0068', '17500', '경기도 안성시 양성면 안성맞춤대로 2304-9', '(양성면, 미곡초등학교)', 'yeojin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 69,  '이시연', '010-0000-0069', '12613', '경기도 여주시 북내면 여양2로 304', '(북내면, 북내초등학교)', 'sihyun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 70,  '강채원', '010-0000-0070', '12617', '경기도 여주시 강천면 원양1로 716', '(강천면, 북내초교)', 'chaewon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 71,  '박지현', '010-0000-0071', '12614', '경기도 여주시 북내면 당전로 284', '(북내면, 북내초등학교 운암분교)', 'jihyun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 72,  '정대희', '010-0000-0072', '17027', '경기도 용인시 처인구 포곡읍 포곡로118번길 61', '(포곡읍, 둔전초등학교)', 'daehee@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 73,  '이태현', '010-0000-0073', '17044', '경기 용인시 처인구 금학로367번길 14', '(김량장동,용인초등학교)', 'taehyun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 74,  '강재민', '010-0000-0074', '17166', '경기도 용인시 처인구 원삼면 원양로 603', '(원삼면, 좌항초등학교)', 'jaemin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 75,  '박정훈', '010-0000-0075', '16866', '경기도 용인시 수지구 용구대로2772번길 15', '(죽전동,죽전초등학교)', 'junghoon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 76,  '정우성', '010-0000-0076', '11104', '경기도 포천시 영북면 영북로148번길 46', '(영북면, 영북초등학교)', 'woosung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 77,  '이성훈', '010-0000-0077', '11127', '경기도 포천시 영중면 호국로 3054', '(영중면,영중초등학교)', 'seonghun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 78,  '강정수', '010-0000-0078', '11126', '경기도 포천시 영중면 전영로1429번길 5', '(영중면,영평초등학교)', 'jeongsu@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 79,  '박연희', '010-0000-0079', '18537', '경기도 화성시 마도면 석교로 157', '(마도면, 마도초등학교)', 'yeonhee@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 80,  '정은지', '010-0000-0080', '18545', '경기도 화성시 송산면 송산포도로 582', '(송산면,마산초등학교)', 'eunji@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 81,  '이상아', '010-0000-0081', '18415', '경기도 화성시 병점1로 105', '(병점동,구봉초등학교)', 'sangah@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 82,  '강한결', '010-0000-0082', '18385', '경기도 화성시 동탄지성로 344', '(반월동,기산초등학교)', 'hankyul@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 83,  '박시현', '010-0000-0083', '18393', '경기도 화성시 병점4로 97', '(진안동,진안초등학교)', 'sihyun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 84,  '정유진', '010-0000-0084', '18403', '경기도 화성시 병점3로 77', '(병점동, 태안초등학교)', 'yujin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 85,  '이하율', '010-0000-0085', '18412', '경기도 화성시 떡전골로 34', '(병점동,화성벌말초등학교)', 'hayul@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 86,  '강재희', '010-0000-0086', '11440', '경기도 양주시 평화로1489번길 29', '(덕계동,덕계초등학교)', 'jaehee@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 87,  '박소영', '010-0000-0087', '25745', '강원도 동해시 파수길 38', '(이로동,삼화초등학교)', 'soyoung@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 88,  '정서연', '010-0000-0088', '25785', '강원도 동해시 동해역길 25', '(송정동, 송정초등학교)', 'seoyeon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 89,  '이영호', '010-0000-0089', '25711', '강원도 동해시 해맞이길 183', '(묵호진동, 창호초등학교)', 'youngho@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 90,  '강태윤', '010-0000-0090', '24522', '강원도 양구군 양구읍 관공서로 56', '(양구읍, 비봉초등학교)', 'taeyun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 91,  '박진우', '010-0000-0091', '24544', '강원도 양구군 양구읍 양구새싹로 48', '(양구읍, 양구초등학교)', 'jinwoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 92,  '정진혁', '010-0000-0092', '24554', '강원도 양구군 남면 정중앙로 624-7', '(남면, 용하초등학교)', 'jinhyuk@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 93,  '이유리', '010-0000-0093', '24511', '강원도 양구군 동면 원당길52번길 9-17', '(동면, 원당초등학교)', 'yuri@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 94,  '강윤수', '010-0000-0094', '26498', '강원도 원주시 부론면 법천시장길 58', '(부론면, 부론초등학교)', 'yoonsoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 95,  '박서연', '010-0000-0095', '26434', '강원도 원주시 단구로 60', '(단계동,북원초등학교)', 'seoyeon@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 96,  '정규리', '010-0000-0096', '26496', '강원도 원주시 문막읍 귀문로 1070', '(문막읍, 비두초등학교)', 'gyuri@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 97,  '이서준', '010-0000-0097', '26300', '강원도 원주시 호저면 칠봉로 347', '(호저면, 산현초등학교)', 'seojun@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 98,  '강유진', '010-0000-0098', '26404', '강원도 원주시 흥업면 사제로 101', '흥업초등학교 (흥업면)', 'yujin@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 99,  '박민재', '010-0000-0099', '24644', '강원도 인제군 인제읍 점봉산로 51', '(인제읍, 귀둔초등학교)', 'minjae@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 100, '정희수', '010-0000-0100', '24660', '강원도 인제군 기린면 기린로 76', '(기린면,기린초등학교)', 'heesoo@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 101, '정진우', '010-0000-0101', '24656', '강원도 인제군 기린면 조침령로 671', '(기린면, 기린초등학교방동분교)', 'minjae@example.com');
INSERT INTO tblMemberInfo (seq, pic, regDate, member_seq, name, tel, zipcode, address, addrDetail, email) VALUES (memberInfo_seq.NEXTVAL, DEFAULT, DEFAULT, 102, '김민재', '010-0000-0102', '16892', '경기도 용인시 기흥구 구성1로 61', '(청덕동, 청덕초등학교)', 'heesoo@example.com');

