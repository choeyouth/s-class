package com.oracle;

public class ex12_Rank_dml {
	
	public static void main(String[] args) {
		
		BasicInfo dbHelper = new BasicInfo();
		
		 String[] insertQueries = {
          "INSERT INTO tblRank VALUES(2,5,5,'2024-02-23')", 
          "INSERT INTO tblRank VALUES(3,2,5,'2024-03-10')", 
          "INSERT INTO tblRank VALUES(4,10,3,'2024-04-05')", 
          "INSERT INTO tblRank VALUES(5,7,4,'2024-05-17')", 
          "INSERT INTO tblRank VALUES(6,15,5,'2024-06-28')", 
          "INSERT INTO tblRank VALUES(7,3,5,'2024-07-12')", 
          "INSERT INTO tblRank VALUES(8,9,1,'2024-08-03')", 
          "INSERT INTO tblRank VALUES(9,6,3,'2024-01-20')", 
          "INSERT INTO tblRank VALUES(10,4,5,'2024-02-11')", 
          "INSERT INTO tblRank VALUES(11,8,3,'2024-03-09')", 
          "INSERT INTO tblRank VALUES(12,12,3,'2024-04-24')", 
          "INSERT INTO tblRank VALUES(13,14,5,'2024-05-30')", 
          "INSERT INTO tblRank VALUES(14,18,3,'2024-06-15')", 
          "INSERT INTO tblRank VALUES(15,16,5,'2024-07-25')", 
          "INSERT INTO tblRank VALUES(16,20,5,'2024-08-01')", 
          "INSERT INTO tblRank VALUES(17,11,4,'2024-01-12')", 
          "INSERT INTO tblRank VALUES(18,17,2,'2024-02-05')", 
          "INSERT INTO tblRank VALUES(19,19,5,'2024-03-22')", 
          "INSERT INTO tblRank VALUES(20,13,4,'2024-04-18')",
          "INSERT INTO tblRank VALUES(1,1,4,'2024-05-02')"
			
	};
		 dbHelper.insertDataBatch(insertQueries);

   }
}