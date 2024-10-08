package com.oracle;

public class Select {

    public static void main(String[] args) {
        // SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo dbHelper = new BasicInfo();

    	
        // 실행할 SQL 쿼리
        String query1 = "SELECT * FROM tblGenreList";
        String query2 = "SELECT * FROM tblSubGenre";
        String query4 = "SELECT * FROM tblBook";
        String query5 = "SELECT * FROM tblManager";
        String query6 = "SELECT * FROM tblMember";
        String query7 = "SELECT * FROM tblMemberInfo";
        String query8 = "SELECT * FROM tblDiscussionBoard";
        String query9 = "SELECT * FROM tblDiscussionReply";
        String query10 = "SELECT * FROM tblBookReview";
        String query11 = "SELECT * FROM tblNote";
        String query12 = "SELECT * FROM tblRank";
        String query13 = "SELECT * FROM tblWordList";
        String query14 = "SELECT * FROM tblQuoteList";
        String query15 = "SELECT * FROM tblFamousLine";
        
        //DML XX
        String query16 = "SELECT * FROM tblBookmark";
        String query17 = "SELECT * FROM tblPreference";
        
        //뷰 
        String query = "SELECT * FROM vwMemberProfile";
        

        // 쿼리 실행
        
        System.out.println("=======================================");
        System.out.println("tblGenreList");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query1);
        
        System.out.println("=======================================");
        System.out.println("tblSubGenre");
        System.out.println("=======================================");
       // dbHelper.executeQuery(query2);
        
        System.out.println("=======================================");
        System.out.println("tblBook");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query4);
        
        System.out.println("=======================================");
        System.out.println("tblManager");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query5);
        
        
        System.out.println("=======================================");
        System.out.println("tblMember");
        System.out.println("=======================================");
        dbHelper.executeQuery(query6);
        
        System.out.println("=======================================");
        System.out.println("tblMemberInfo");
        System.out.println("=======================================");
        dbHelper.executeQuery(query7);
        
        System.out.println("=======================================");
        System.out.println("tblDiscussionBoard");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query8);
        
        System.out.println("=======================================");
        System.out.println("tblDiscussionReply");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query9);
        
        System.out.println("=======================================");
        System.out.println("tblBookReview");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query10);
        
        System.out.println("=======================================");
        System.out.println("tblNote");
        System.out.println("=======================================");
       // dbHelper.executeQuery(query11);
        
        System.out.println("=======================================");
        System.out.println("tblRank");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query12);
        
        
        System.out.println("=======================================");
        System.out.println("tblWordList");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query13);
        
        System.out.println("=======================================");
        System.out.println("tblQuoteList");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query14);
        
        
        System.out.println("=======================================");
        System.out.println("tblFamousLine");
        System.out.println("=======================================");
        dbHelper.executeQuery(query15);
        
        System.out.println("=======================================");
        System.out.println("tblBookmark");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query16);
        
        
        System.out.println("=======================================");
        System.out.println("tblPreference");
        System.out.println("=======================================");
        dbHelper.executeQuery(query17);
        
        System.out.println("=======================================");
        System.out.println("vwMemberProfile");
        System.out.println("=======================================");
        //dbHelper.executeQuery(query);
        
        
      
        

    }
}
