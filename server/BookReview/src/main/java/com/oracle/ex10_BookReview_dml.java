package com.oracle;

import com.oracle.BasicInfo;

public class ex10_BookReview_dml {
	
	public static void main(String[] args) {
		
		BasicInfo dbHelper = new BasicInfo();
		
		
		 String[] insertQueries = {
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788934942467, 1)", //총 균 쇠- 인간 사회의 운명을 바꾼 힘
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788937443848, 4)", //이방인
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788932473901, 7)", //이기적 유전자 - 40주년 기념판
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788937460883, 10)", //오만과 편견
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788937460388, 3)", //달과 6펜스
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788993178692, 9)", //지리의 힘 - 지리는 어떻게 개인의 운명을, 세계사를, 세계 경제를 좌우하는가
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9791171830114, 5)", //오십에 읽는 손자병법 - 불확실한 삶을 대비하기 위한 2,500년의 전략 
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788994054483, 11)", //시시포스 신화 - 부조리에 관한 시론
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788934942467, 8)", //총 균 쇠 - 인간 사회의 운명을 바꾼 힘
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788937462672, 2)", //페스트
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9791192300245, 17)", //마흔에 읽는 니체 - 지금 이 순간을 살기 위한 철학 수업
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788937460944, 12)", //차라투스트라는 이렇게 말했다
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788934942467, 20)", //총 균 쇠- 인간 사회의 운명을 바꾼 힘
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9791139717891, 13)", //니체의 자존감 수업 - 니체에게 배우는 나를 사랑하고 긍정하는 기술
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788934972464, 6)", //사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788936456085, 15)", //완득이 - 제1회 창비 청소년문학상 수상작
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9791193506387, 18)", //혼자일 수 없다면 나아갈 수 없다 - 프리드리히 니체 아포리즘
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9788920037054, 14)", //동양철학산책 (워크북 포함)
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9791160024357, 19)", //니체의 인생 수업
				 "INSERT INTO tblBookReview VALUES(Bookreview_seq.NEXTVAL, 9791191393163, 16)", //돈의 역사는 되풀이된다 - 돈의 흐름을 읽는 눈
		 
		 };
		
		 
		 
		 // 배치 처리로 여러 데이터 삽입
	        dbHelper.insertDataBatch(insertQueries);	 
		 
	}

}
