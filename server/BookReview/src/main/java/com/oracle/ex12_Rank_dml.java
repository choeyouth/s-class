package com.oracle;

import com.oracle.BasicInfo;

public class ex12_Rank_dml {
	
	public static void main(String[] args) {
		
		BasicInfo dbHelper = new BasicInfo();
		
		 String[] insertQueries = {
		
		 //총 균 쇠- 인간 사회의 운명을 바꾼 힘
		 //이방인
		 //이기적 유전자 - 40주년 기념판
		 //오만과 편견
		 //달과 6펜스
		 //지리의 힘 - 지리는 어떻게 개인의 운명을, 세계사를, 세계 경제를 좌우하는가
		 //오십에 읽는 손자병법 - 불확실한 삶을 대비하기 위한 2,500년의 전략 
		 //시시포스 신화 - 부조리에 관한 시론
		 //총 균 쇠 - 인간 사회의 운명을 바꾼 힘
		 //페스트
		 //마흔에 읽는 니체 - 지금 이 순간을 살기 위한 철학 수업
		 //차라투스트라는 이렇게 말했다
		 //총 균 쇠- 인간 사회의 운명을 바꾼 힘
		 //니체의 자존감 수업 - 니체에게 배우는 나를 사랑하고 긍정하는 기술
		 //사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문
		 //완득이 - 제1회 창비 청소년문학상 수상작
		 //혼자일 수 없다면 나아갈 수 없다 - 프리드리히 니체 아포리즘
		 //동양철학산책 (워크북 포함)
		 //니체의 인생 수업
		 //돈의 역사는 되풀이된다 - 돈의 흐름을 읽는 눈
				 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788934942467, 1 , 5, '2024-02-23')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788937443848, 4 , 5, '2024-03-10')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788932473901, 7 , 3, '2024-04-05')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788937460883, 10, 4, '2024-05-17')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788937460388, 3 , 5, '2024-06-28')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788993178692, 9 , 5, '2024-07-12')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9791171830114, 5 , 1, '2024-08-03')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788994054483, 11, 3, '2024-01-20')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788934942467, 8 , 5, '2024-02-11')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788937462672, 2 , 3, '2024-03-09')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9791192300245, 17, 3, '2024-04-24')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788937460944, 12, 5, '2024-05-30')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788934942467, 20, 3, '2024-06-15')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9791139717891, 13, 5, '2024-07-25')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788934972464, 6 , 5, '2024-08-01')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788936456085, 15, 4, '2024-01-12')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9791193506387, 18, 2, '2024-02-05')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9788920037054, 14, 5, '2024-03-22')", 
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9791160024357, 19, 4, '2024-04-18')",
          "INSERT INTO tblRank VALUES(rank_seq.NEXTVAL, 9791191393163, 16, 4, '2024-05-02')"
			
	};
		 dbHelper.insertDataBatch(insertQueries);

   }
}