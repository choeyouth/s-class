package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class DiscussionBoard2 {
	
	BasicInfo dbHelper = new BasicInfo();
	String[] dbView = {"번호", "책 제목", "글 제목", "글 내용", "등록자 아이디", "등록일"};
	bookReviewView brv = new bookReviewView();
	Scanner scan = new Scanner(System.in);
	MainMenu mmu = new MainMenu();
	
	public void titleView(int seq) {
		
        String query = "SELECT * FROM vwDiscussion ORDER BY seq DESC";
        
        try (Connection conn = dbHelper.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) 
        	{ ResultSetMetaData rsmd = rs.getMetaData();
              int columnCnt = rsmd.getColumnCount();
              
              System.out.println();
              System.out.println("토론 게시판 글 목록 조회...");
              brv.sleep(1000);
              
              System.out.println();
              System.out.println("--------------------------------------------------------------------");
              System.out.println("|  번호  |               게시글                 |       책 제목       |");
              System.out.println("--------------------------------------------------------------------");
              
              int count = 0;
              brv.sleep(500);
              
              while (rs.next()) {
            	  
	            	count++;
	   
					if (count == 10) {
						brv.pause();
						System.out.println("-----------------------------------------------------------------");
						count = 0;
					} 
            	   
            	  for (int i = 1; i <= columnCnt; i++) {
						
//            		  System.out.println(rs.getString("seq"));
            		  
                	   if (i == 1) {
                		   System.out.print("|   " + rs.getString(i));
                	   } else if (i == 2) {
                		   System.out.print("  |\t" + rs.getString(i));
                	   } else if (i == 5) {
                		   System.out.println("\t|\t" + rs.getString(i) + "\t|");
                	   }
                   }
                   System.out.println("-----------------------------------------------------------------");
               }
              
           } catch (Exception e) {
               e.printStackTrace();
           } 
        
        // 게시글 번호 선택 > 게시글 조회 > 댓글
        
		System.out.print("게시물 보기(y/n) : ");
		String input = scan.nextLine();
		
		if (input.equals("y")) {
			System.out.println();
			System.out.println();
			postView(seq);
		} else {
			System.out.println();
			System.out.println("메뉴로 돌아갑니다..");
			brv.sleep(1000);
			System.out.println();
			mmu.mainService(seq);
		}
        
	}

	private void postView(int seq) {

		System.out.print("번호: ");
		brv.sleep(1000);
		
		String postSeq = scan.nextLine();
		
		String query = "SELECT * FROM vwDiscussionBoard WHERE seq = '" + postSeq + "'";
		
		try (Connection conn = dbHelper.getConnection();
		     Statement stmt = conn.createStatement();
		     ResultSet rs = stmt.executeQuery(query)) 
		{  
			
			while (rs.next()) {
				
				String postId = rs.getString("postId");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String postDate = rs.getString("postDate");
				String bookTitle = rs.getString("bookTitle");
				
				int maxLen = 50;
				int arraySize = (int) Math.ceil((double) content.length() / maxLen);  // 배열 크기 설정
		        String[] resultArray = new String[arraySize];  // 분할된 문자열을 저장할 배열

		        for (int i = 0; i < arraySize; i++) {
		            int start = i * maxLen;  // 시작 인덱스
		            int end = Math.min(start + maxLen, content.length());  // 끝 인덱스 (문자열 길이 초과 방지)

		            resultArray[i] = content.substring(start, end);  // 부분 문자열을 배열에 저장
		        }

				System.out.println("------------------------------------------------------------------------------------");
				System.out.println("|  " + postSeq + "  |  " + postId + "  |  " + title + "  |  "  + bookTitle + "  |  " + postDate + "  |");
				System.out.println("------------------------------------------------------------------------------------");
		        
		        for (String str : resultArray) {
		            System.out.println("|     " + str);
		        }
				System.out.println("------------------------------------------------------------------------------------");
				
				brv.sleep(1000);
				System.out.print("댓글 보기(y/n) : ");
				String input = scan.nextLine();
				
				if (input.equals("y")) {
					System.out.println();
					brv.sleep(1000);
					replyView(query, seq, postSeq);
				} else {
					System.out.println();
					brv.sleep(1000);
					System.out.println("글 목록으로 돌아갑니다..");
					titleView(seq);
				}
				
			}

		} catch (Exception e) {
			System.out.println("DiscussionBoard.postView");
			e.printStackTrace();
		}
	}

	private void replyView(String query, int seq, String postSeq) {

		try (Connection conn = dbHelper.getConnection();
		     Statement stmt = conn.createStatement();
		     ResultSet rs = stmt.executeQuery(query))  {
			
			while (rs.next()) {
				
				String replyId = rs.getString("replyId");
				String reply = rs.getString("reply");
				String commitDate = rs.getString("commitDate");
				
				int maxLen = 50;
				int arraySize = (int) Math.ceil((double) reply.length() / maxLen);  
		        String[] resultArray = new String[arraySize];  

		        for (int i = 0; i < arraySize; i++) {
		            int start = i * maxLen;  // 시작 인덱스
		            int end = Math.min(start + maxLen, reply.length()); 

		            resultArray[i] = reply.substring(start, end); 
		        }
				
		        System.out.println("------------------------------------------------------------------------------------");
				System.out.println("|     " + replyId + "        |                               " + commitDate);
				System.out.println("------------------------------------------------------------------------------------");
				for (String str : resultArray) {
		            System.out.println("|     " + str);
		        }
		        System.out.println("------------------------------------------------------------------------------------");
				
		        System.out.print("댓글 작성(y/n): ");
		        String input = scan.nextLine();
		        
		        if (input.equals("y")) {
		        	replyPost(seq, postSeq);
		        } else {
		        	System.out.println("글 목록으로 돌아갑니다..");
		        	titleView(seq);
		        }
		        
			}
			
		} catch (Exception e) {
			System.out.println("DiscussionBoard.replyView");
			e.printStackTrace();
		}
	}

	private void replyPost(int seq, String postSeq) {
		
		System.out.print("댓글: ");
		String reply = scan.nextLine();
		String query = "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (30, ?, ?, ?, SYSDATE)";
		
		try (Connection conn = dbHelper.getConnection();
			 PreparedStatement pstat = conn.prepareStatement(query);) {
			
			pstat.setString(1, postSeq);
			pstat.setInt(2, seq);
			pstat.setString(3, reply);

			if (pstat.executeUpdate() == 1) {
				System.out.println("댓글 등록 완료!");
			}
			
			pstat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("DiscussionBoard.replyPost");
			e.printStackTrace();
		}
		

	}
}









