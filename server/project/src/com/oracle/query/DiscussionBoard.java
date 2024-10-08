package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class DiscussionBoard {
	
	BasicInfo dbHelper = new BasicInfo();	
	View brv = new View();
	BookSearchAndSave bs = new BookSearchAndSave();
	
	Scanner scan = new Scanner(System.in);
	MainMenu mmu = new MainMenu();
	
	public void mainBoard(int seq) {
		
        String query = "SELECT distinct seq, title, bookTitle FROM vwDiscussion ORDER BY seq DESC";
        
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
                	   if (i == 1) {
                		   System.out.print("|   " + rs.getString(i));
                	   } else if (i == 2) {
                		   System.out.print("  |\t" + rs.getString(i));
                	   } else if (i == 3) {
                		   System.out.println("\t|\t" + rs.getString(i) + "\t|");
                	   }
                   }
                   System.out.println("-----------------------------------------------------------------");
               }
              
           } catch (Exception e) {
               e.printStackTrace();
           } 
        
        // 게시글 번호 선택 > 게시글 조회 > 댓글
        System.out.println();
        System.out.println("=================================================================");
        System.out.println("   게시물 쓰기(c)    게시물 읽기(r)    게시물 수정(u)    게시물 삭제(d)"); 
        System.out.println("=================================================================");
        System.out.println();
		System.out.print("입력: ");
		String input = scan.nextLine();
		System.out.println();
		
		if (input.equals("c")) {
			System.out.println();
			postCreate(seq);
		} else if (input.equals("r")) {
			System.out.println();
			postRead(seq);
		} else if (input.equals("u")) {
			System.out.println();
			postUpdate(seq);
		} else if (input.equals("d")) {
			System.out.println();
			postDel(seq);
		} else {
			System.out.println();
			System.out.println("메뉴로 돌아갑니다..");
			brv.sleep(1000);
			System.out.println();
			mmu.mainService(seq);
		}
        
	}



	// 게시글 CRUD 
	private void postCreate(int seq) {
		
		System.out.println("----------- 게시글 작성 -----------");

		String book_seq = bs.main(seq);
		
		if (book_seq != null) {
			
			System.out.print("글 제목: ");
			String title = scan.nextLine();

			System.out.print("내용: ");
			String content = scan.nextLine();
			
			String query = "INSERT INTO tblDiscussionBoard (seq, book_seq, member_seq, title, content, postDate) VALUES (discussionBoard_seq.NEXTVAL, ?, ?, ?, ?, SYSDATE)";
			
			try (Connection conn = dbHelper.getConnection();
				 PreparedStatement pstat = conn.prepareStatement(query);) {
				
				pstat.setString(1, book_seq);
				pstat.setInt(2, seq);
				pstat.setString(3, title);
				pstat.setString(4, content);

				if (pstat.executeUpdate() == 1) {
					System.out.println("게시글 등록 완료!");
				}
				
				pstat.close();
				conn.close();
				
			} catch (Exception e) {
				System.out.println("DiscussionBoard.postCreate");
				e.printStackTrace();
			}
			
		} else {
			System.out.println("책이 준비되어있지 않습니다. 가까운 시일안에 준비하도록 하겠습니다.");
		}
		
		mainBoard(seq);
		
	}

	private void postRead(int seq) {

		System.out.print("번호: ");
		brv.sleep(1000);
		
		String postSeq = scan.nextLine();
		
		String query = "SELECT * FROM vwDiscussionPost WHERE seq = '" + postSeq + "'";
		
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
				String reply = rs.getString("reply");
				
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
				
				if (reply != null) {
				
					brv.sleep(1000);
			        System.out.println();
			        System.out.println("=================================================================");
			        System.out.println("              댓글 쓰기(c)                댓글 읽기(r)     "); 
			        System.out.println("=================================================================");
			        System.out.println();
					System.out.print("입력: ");
					String input = scan.nextLine();
					System.out.println();
					
					if (input.equals("c")) {
						System.out.println();
						brv.sleep(1000);
						replyCreate(seq, postSeq);
					} else if (input.equals("r")) {
						System.out.println();
						brv.sleep(1000);
						replyRead(seq, postSeq);
					} else {
						System.out.println();
						brv.sleep(1000);
						System.out.println("글 목록으로 돌아갑니다..");
						mainBoard(seq);
					}
					
				} else {
					
					System.out.println();
					System.out.println("아직 댓글이 없습니다.");
					
					System.out.print("댓글 작성(y/n): ");
			        String input = scan.nextLine();
			        
			        if (input.equals("y")) {
			        	replyCreate(seq, postSeq);
			        } else {
			        	System.out.println("글 목록으로 돌아갑니다..");
			        	mainBoard(seq);
			        }
					
				}
				
			}
			
			
		} catch (Exception e) {
			System.out.println("DiscussionBoard.postRead");
			e.printStackTrace();
		}
		
	}



	private void postUpdate(int seq) {
		
		//회원 seq와 작성자 seq가 같을 때 글 수정  
		System.out.println("----------- 게시글 수정 -----------");
		
		System.out.print("번호: ");
		String postSeq = scan.nextLine();
		
		String isQuery = "SELECT * FROM tblDiscussionBoard WHERE seq = ? AND member_seq = ?";
		String upQuery = "UPDATE tblDiscussionBoard SET title = ?, content = ? WHERE seq = ?";
		
		try (Connection conn = dbHelper.getConnection();
		     PreparedStatement isPstat = conn.prepareStatement(isQuery);
    		 PreparedStatement upPstat = conn.prepareStatement(upQuery)) {  
			
			isPstat.setString(1, postSeq);
			isPstat.setInt(2, seq);
			
			ResultSet rs = isPstat.executeQuery();
			
			if (rs.next()) {
			
				System.out.print("새로운 제목: ");
				String newTitle = scan.nextLine();
				
				System.out.print("새로운 내용: ");
				String newContent = scan.nextLine();
				
				upPstat.setString(1, newTitle);
				upPstat.setString(2, newContent);
				upPstat.setString(3, postSeq);
				
	            int upNum = upPstat.executeUpdate();
	            
	            if (upNum > 0) {
	                System.out.println("게시글이 성공적으로 수정되었습니다.");
	            } else {
	                System.out.println("게시글 수정에 실패했습니다.");
	            }
			
			} else {
				System.out.println("해당 게시글을 수정할 권한이 없습니다. 확인 후 다시 시도해 주세요..");
				mainBoard(seq);
			}
				
				
		} catch (Exception e) {
			System.out.println("DiscussionBoard.postUpdate");
			e.printStackTrace();
		}
		
		mainBoard(seq);
		
	}
	
	
	private void postDel(int seq) {
		
		//회원 seq와 작성자 seq가 같을 때 삭제 > 댓글 있는지 확인 > 댓글 삭제 > 게시글 삭제 
		System.out.println("----------- 게시글 삭제 -----------");
		
		System.out.print("번호: ");
		String postSeq = scan.nextLine();
		
		String isQuery = "SELECT * FROM tblDiscussionBoard WHERE seq = ? AND member_seq = ?";
		String replyQuery = "DELETE FROM tblDiscussionReply WHERE discussionBoard_seq = ?";
		String postQuery = "DELETE FROM tblDiscussionBoard WHERE seq = ?";
		
		try (Connection conn = dbHelper.getConnection();
			 PreparedStatement isPstat = conn.prepareStatement(isQuery);
			 PreparedStatement repPstat = conn.prepareStatement(replyQuery);
		     PreparedStatement postPstat = conn.prepareStatement(postQuery)) {  
			
			isPstat.setString(1, postSeq);
			isPstat.setInt(2, seq);
			
			ResultSet rs = isPstat.executeQuery();
			
			if (rs.next()) {
				
				repPstat.setString(1, postSeq);
				int replyNum = repPstat.executeUpdate();
				
				postPstat.setString(1, postSeq);
				int postNum = postPstat.executeUpdate();
				
				if (replyNum > 0) {
					System.out.println();
					System.out.println("해당 게시글의 댓글이 삭제되었습니다.");
				}
				
				if (postNum > 0) {
					System.out.println();
					System.out.println("게시글이 정상적으로 삭제되었습니다.");
				} 
				
			} else {
				System.out.println("해당 게시글을 삭제할 권한이 없습니다. 확인 후 다시 시도해 주세요.");
			}
		
		} catch (Exception e) {
			System.out.println("DiscussionBoard.postDel");
			e.printStackTrace();
		}
		
		mainBoard(seq);
		
	}
	
	
	// 댓글 CRUD 
	private void replyCreate(int seq, String postSeq) {
		
		System.out.print("댓글: ");
		String reply = scan.nextLine();
		String query = "INSERT INTO tblDiscussionReply (seq, discussionBoard_seq, member_seq, reply, commitDate) VALUES (discussionReply_seq.NEXTVAL, ?, ?, ?, SYSDATE)";
		
		try (Connection conn = dbHelper.getConnection();
			 PreparedStatement pstat = conn.prepareStatement(query);) {
			
			pstat.setString(1, postSeq);
			pstat.setInt(2, seq);
			pstat.setString(3, reply);

			if (pstat.executeUpdate() == 1) {
				System.out.println("댓글 등록 완료!");
				System.out.println("댓글 목록으로 돌아갑니다..");
				replyRead(seq, postSeq);
			}
			
			pstat.close();
			conn.close();
			
		} catch (Exception e) {
			System.out.println("DiscussionBoard.replyCreate");
			e.printStackTrace();
		}
	}

	

	private void replyRead(int seq, String postSeq) {
		
		String query = "SELECT * FROM vwDiscussionBoard WHERE seq = '" + postSeq + "'";
		String replySeq = "";

		try (Connection conn = dbHelper.getConnection();
		     Statement stmt = conn.createStatement();
		     ResultSet rs = stmt.executeQuery(query))  {
			
			boolean hasReplies = false; 
			
			while (rs.next()) {
				
				hasReplies = true;
			
				String replyId = rs.getString("replyId");
				String reply = rs.getString("reply");
				String commitDate = rs.getString("commitDate");
				replySeq = rs.getString("replySeq");
				
				int maxLen = 50;
				int arraySize = (int) Math.ceil((double) reply.length() / maxLen);  
		        String[] resultArray = new String[arraySize];  

		        for (int i = 0; i < arraySize; i++) {
		            int start = i * maxLen;  // 시작 인덱스
		            int end = Math.min(start + maxLen, reply.length()); 

		            resultArray[i] = reply.substring(start, end); 
		        }
				

	            System.out.println("------------------------------------------------------------------------------------");
	            System.out.printf("| 번호: %s  |  댓글 작성자: %s  |                         등록일: %s\r\n", replySeq, replyId, commitDate);
	            System.out.println("------------------------------------------------------------------------------------");
	            
				for (String str : resultArray) {
		            System.out.println("|     " + str);
		        }
		        System.out.println("------------------------------------------------------------------------------------");
		        
			}
			
	        System.out.println();
	        System.out.println("=================================================================");
	        System.out.println("      댓글 쓰기(c)     댓글 수정(u)     댓글 삭제(d)     돌아가기(b)"); 
	        System.out.println("=================================================================");
	        System.out.println();
			System.out.print("입력: ");
	        String input = scan.nextLine();
	        
	        if (input.equals("c")) {
	        	replyCreate(seq, postSeq);
	        } else if (input.equals("u")) {
	        	replyUpdate(seq);
	        } else if (input.equals("d")) {
	        	replyDel(seq);
	        } else {
	        	System.out.println("글 목록으로 돌아갑니다..");
	        	mainBoard(seq);
	        }
			
		} catch (Exception e) {
			System.out.println("DiscussionBoard.replyRead");
			e.printStackTrace();
		}
	}
	
	
	private void replyUpdate(int seq) {
		
		//댓글 작성자, 댓글 번호가 일치하면 수정 
		System.out.println("----------- 댓글 수정 -----------");
		
		System.out.print("번호: ");
		String replySeq = scan.nextLine();
		
		String isQuery = "SELECT * FROM tblDiscussionReply WHERE seq = ? AND member_seq = ?";
		String upQuery = "UPDATE tblDiscussionReply SET reply = ? WHERE seq = ?";
		
		try (Connection conn = dbHelper.getConnection();
		     PreparedStatement isPstat = conn.prepareStatement(isQuery);
			 PreparedStatement upPstat = conn.prepareStatement(upQuery)) {  
			
			isPstat.setString(1, replySeq);
			isPstat.setInt(2, seq);
			
			ResultSet rs = isPstat.executeQuery();
			
			if (rs.next()) {
			
				System.out.print("새로운 댓글: ");
				String newReply = scan.nextLine();
				
				upPstat.setString(1, newReply);
				upPstat.setString(2, replySeq);
				
	           int upNum = upPstat.executeUpdate();
	           
	           if (upNum > 0) {
	               System.out.println("댓글이 성공적으로 수정되었습니다.");
	           } else {
	               System.out.println("댓글 수정에 실패했습니다.");
	           }
			
			} else {
				System.out.println("해당 댓글을 수정할 권한이 없습니다. 확인 후 다시 시도해 주세요..");
			}
				
				
		} catch (Exception e) {
			System.out.println("DiscussionBoard.postUpdate");
			e.printStackTrace();
		}
		
		mainBoard(seq);
		
	}

	private void replyDel(int seq) {
		
		//댓글 작성자, 댓글 번호가 일치하면 삭제 
		System.out.println("----------- 댓글 삭제 -----------");
		
		System.out.print("번호: ");
		String replySeq = scan.nextLine();
		
		String query = "DELETE FROM tblDiscussionReply WHERE seq = ? AND member_seq = ?";
		
		try (Connection conn = dbHelper.getConnection();
		     PreparedStatement pstat = conn.prepareStatement(query)) {  
			
			pstat.setString(1, replySeq);
			pstat.setInt(2, seq);
			
			int delNum = pstat.executeUpdate();
			
			if (delNum > 0) {
				System.out.println("댓글이 정상적으로 삭제되었습니다.");
			} else {
				System.out.println("해당 댓글을 삭제할 권한이 없습니다. 확인 후 다시 시도해 주세요.");
			}
		
		} catch (Exception e) {
			System.out.println("DiscussionBoard.postDel");
			e.printStackTrace();
		}
		
		mainBoard(seq);
	}
	
}





