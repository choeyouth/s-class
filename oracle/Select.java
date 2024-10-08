package oracle;

public class Select {

    public static void main(String[] args) {
        // SQL 실행부를 담당하는 DBHelper 객체 생성
    	BasicInfo_me dbHelper = new BasicInfo_me();

        // 실행할 SQL 쿼리
        String query1 = "SELECT * FROM tblBook";
        String query2 = "SELECT * FROM tblMember";
        String query3 = "SELECT * FROM tblMemberInfo";
        String query4 = "SELECT * FROM tblManager";
        String query5 = "SELECT * FROM tblGenreList";
        String query6 = "SELECT * FROM tblDiscussionBoard";
        String query7 = "SELECT * FROM tblDiscussionReply";
        

        // 쿼리 실행
        
        System.out.println("=======================================");
        System.out.println("tblBook");
        System.out.println("=======================================");
        dbHelper.executeQuery(query1);
        
        System.out.println("=======================================");
        System.out.println("tblMember");
        System.out.println("=======================================");
        dbHelper.executeQuery(query2);
        
        System.out.println("=======================================");
        System.out.println("tblMemberInfo");
        System.out.println("=======================================");
        dbHelper.executeQuery(query3);
        
        System.out.println("=======================================");
        System.out.println("tblManager");
        System.out.println("=======================================");
        dbHelper.executeQuery(query4);
        
        System.out.println("=======================================");
        System.out.println("tblGenreList");
        System.out.println("=======================================");
        dbHelper.executeQuery(query5);
        
        System.out.println("=======================================");
        System.out.println("tblDiscussionBoard");
        System.out.println("=======================================");
        dbHelper.executeQuery(query6);
        
        System.out.println("=======================================");
        System.out.println("tblDiscussionReply");
        System.out.println("=======================================");
        dbHelper.executeQuery(query7);
    }
}
