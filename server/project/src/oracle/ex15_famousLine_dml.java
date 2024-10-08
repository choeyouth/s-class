package com.oracle;

public class ex15_famousLine_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터 삽입 SQL 쿼리
        String[] insertQueries = {
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788974255954, '세상에서 가장 설득하기 힘든 것은 나 자신이다.세상에 지지 말자. 안될 거라고 말하는 세상에 쉽게 설득 당하지 말자')", //강남구의 청춘, 거침없이 달려라
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788937462788, '인간은 패배하도록 만들어진 것은 아니다. 인간은 파괴될 지언정 패배할 수는 없다')", //노인과 바다
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788932917245, '네 장미꽃을 그렇게 소중하게 만든 것은 그 꽃을 위해 네가 소비한 시간이란다. 가장 중요한 것은 눈에 보이지 않는 법이다.')", //어린 왕자
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788954429900, '삶의 후회를 남기지 말고, 사랑하는데 이유를 달지 마세요.')", //마법의 순간(파울로코엘료)
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788993734966, '우리는 인생의 날들을 늘릴수는 없지만, 그 날들에 생기를 불어 넣을 수는 있다.')", //당신의 완벽한 1년
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788937437564, '인간은 가장 깊은 절망의 순간에서조차 아름다운의 법칙에 따라 자신의 삶을 작곡한다.')", //참을수 없는 존재의 가벼움
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788934976417, '천재는 노력하는 사람을 이기지 못하고, 노력하는 사람은 즐기는 사람을 이기지 못한다. 그러나 즐기는 사람은 돈 받고 일하는 사람에게는 이길 수 없다.')", //조승연의 이야기 인문학
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788932917207, '수백 년 동안 졌다고 해서 시작하기도 전에 이기려는 노력도 하지 말아야 할 까닭은 없으니까')", //앵무새죽이기(하퍼 리)
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9788954620437, '우리가 중요시 여기는 것은 D를 강조한 네가지입니다. DANCE(춤), DRAMTICS(연극), DEBATING(토론), DATING(이성교제)')", //롤리타(블라디미드 나보코프)
        	    "INSERT INTO tblFamousLine VALUES (famousline_seq.NEXTVAL, 9791197377150, '인생에 지나가는 사람들에게 상처받지 말자. 그들은 어자피 인생에서 지나가는 사람들일 뿐이다.')" //나는 나로 살기로 했다
        };


        // 데이터 삽입 메서드 호출
        for (String insertQuery : insertQueries) {
            dbHelper.insertData(insertQuery);
        }
    }
}