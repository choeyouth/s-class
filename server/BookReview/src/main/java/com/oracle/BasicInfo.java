package com.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class BasicInfo {

    // 오라클 DB 연결 정보
    private String url = "jdbc:oracle:thin:@localhost:1521:xe"; // 오라클 DB URL
    private String user = "system"; // 오라클 사용자 이름
    private String password = "oracle"; // 오라클 비밀번호

    // DB 연결을 위한 메서드
    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, user, password);
    }

    // 테이블 생성 메서드
    public void createTable(String createQuery) {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(createQuery);
            System.out.println("테이블이 성공적으로 생성되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 테이블 삭제 메서드
    public void dropTable(String tableName) {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            String dropTableQuery = "DROP TABLE " + tableName;
            stmt.executeUpdate(dropTableQuery);
            System.out.println("테이블 " + tableName + "이 성공적으로 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 외래 키 제약 조건 추가 메서드
    public void addForeignKey(String tableName, String fkColumn, String refTable, String refColumn) {
        String addForeignKeyQuery = "ALTER TABLE " + tableName +
            " ADD CONSTRAINT fk_" + tableName + "_" + fkColumn +
            " FOREIGN KEY (" + fkColumn + ") REFERENCES " + refTable + "(" + refColumn + ")";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.execute(addForeignKeyQuery);
            System.out.println("Foreign key added successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 시퀀스 생성 메서드
    public void createSequence(String sequenceQuery) {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(sequenceQuery);
            System.out.println("시퀀스가 성공적으로 생성되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 시퀀스 삭제 메서드
    public void dropSequence(String sequenceName) {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            // 시퀀스 삭제 SQL 쿼리 실행
            String dropSequenceQuery = "DROP SEQUENCE " + sequenceName;
            stmt.executeUpdate(dropSequenceQuery);
            System.out.println("시퀀스 " + sequenceName + "가 성공적으로 삭제되었습니다.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // 데이터 삽입 메서드
    public void insertData(String insertQuery) {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(insertQuery);
            System.out.println("데이터가 성공적으로 삽입되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 기존 쿼리 실행 메서드 (데이터 조회용)
   public int executeQuery(String query) {
    	
    	int result = 0;
    	
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnCnt = rsmd.getColumnCount();
            
            while (rs.next()) {
            	
            	result = 1;
            	
                for (int i = 1; i <= columnCnt; i++) {
                    System.out.println(rsmd.getColumnName(i) + " : " + rs.getString(i));
                }
                System.out.println("---------------------------------------");
                
                return result;
                
            }
            
            
        } catch (Exception e) {
            // Print the failure message along with the exception details
            System.out.println("쿼리 실행에 실패했습니다: " + e.getMessage());
            e.printStackTrace();
        }
        
        return result;
    }


    // 데이터 삭제 메서드
    public void deleteData(String deleteQuery) {
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement()) {
            stmt.executeUpdate(deleteQuery);  // DELETE 쿼리 실행
            System.out.println("데이터가 성공적으로 삭제되었습니다.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    // 배치 처리로 여러 데이터를 삽입하는 메서드
    public void insertDataBatch(String[] insertQueries) {
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, password);
            stmt = conn.createStatement();
            conn.setAutoCommit(false); // 자동 커밋을 비활성화하여 배치 실행

            // 쿼리 배열을 통해 여러 SQL 문을 배치로 추가
            for (String query : insertQueries) {
                stmt.addBatch(query);
            }

            // 배치 실행
            stmt.executeBatch();
            conn.commit(); // 커밋하여 모든 삽입을 완료

            System.out.println("데이터가 배치 처리로 성공적으로 삽입되었습니다.");

        } catch (Exception e) {
            if (conn != null) {
                try {
                    conn.rollback(); // 오류 발생 시 롤백
                } catch (Exception rollbackEx) {
                    rollbackEx.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    
    // 뷰 생성 메서드
    public void createView(String viewName, String joinQuery) {
    	
    	String createViewQuery = "CREATE OR REPLACE VIEW " + viewName + " AS " + joinQuery;
    	try (Connection conn = getConnection();
    		 Statement stmt = conn.createStatement()) {
    		stmt.executeUpdate(createViewQuery);
    		System.out.println("뷰 '" + viewName + "'가 성공적으로 생성되었습니다. ");
    	} catch (SQLException e) {
    		e.printStackTrace();
    	}
    }
    
    

  //데이터 변수화 메소드 
  public int check(String query) {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      int num= -1;

      try {
          // JDBC 드라이버 로드
          Class.forName("oracle.jdbc.driver.OracleDriver");

          // DB 연결
          conn = DriverManager.getConnection(url, user, password);
          //System.out.println("오라클 데이터베이스에 연결 성공!");

          // SQL 쿼리 실행
          stmt = conn.createStatement();
          rs = stmt.executeQuery(query);
          ResultSetMetaData rsmd = rs.getMetaData();
          int columnCnt = rsmd.getColumnCount(); // 컬럼의 수

          // 결과 출력
          while (rs.next()) {
              for (int i = 1; i <= columnCnt; i++) {
                  num= Integer.parseInt(rs.getString(i));
              }
          }

      } catch (Exception e) {
          e.printStackTrace();
      } finally {
          try {
              if (rs != null) rs.close();
              if (stmt != null) stmt.close();
              if (conn != null) conn.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
      }
      return num;
  }
}
