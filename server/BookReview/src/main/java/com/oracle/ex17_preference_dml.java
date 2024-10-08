package com.oracle;

import com.oracle.BasicInfo;

public class ex17_preference_dml {

    public static void main(String[] args) {
        // DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터 삽입 SQL 쿼리
        String[] insertQueries = {
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,1,529,1)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,2,2072,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,3,3036,5)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,5,1193,4)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,7,1181,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,11,8891,1)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,13,1290,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,17,8863,4)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,19,2159,5)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,23,27,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,29,7477,2)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,31,8340,2)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,37,9302,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,41,7800,1)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,43,4835,4)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,47,736,5)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,53,1500,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,59,2096,4)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,61,9379,1)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,67,8547,4)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,71,3367,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,73,7104,1)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,79,727,3)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,83,9458,2)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,89,8590,5)",
        		"INSERT INTO tblPreference VALUES(preference_seq.NEXTVAL,97,8978,3)"
        };

        // 데이터 삽입 메서드 호출
        for (String insertQuery : insertQueries) {
            dbHelper.insertData(insertQuery);
        }
    }
}