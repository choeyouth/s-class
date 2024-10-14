package com.test.toy.board.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.toy.board.model.BoardDTO;
import com.test.toy.board.model.CommentDTO;
import com.test.util.DBUtil;

import oracle.net.aso.r;

public class BoardDAO {
	
	private static BoardDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	private BoardDAO() {
		this.conn = DBUtil.open("localhost", "toy", "java1234");
	}
	
	public static BoardDAO getInstance() {
		if (dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}
	
	
	//- 글쓰기
	//- 목록보기
	//- 상세보기(글 1개)
	//- 조회수 증가하기
	//- 수정하기
	//- 삭제하기
	
	//- 글쓰기
	public int add(BoardDTO dto) {
		
		//queryParamNoReturn
		try {

			String sql = "insert into tblBoard (seq, subject, content, regdate, readcount, id, thread, depth, attach) values (seqBoard.nextVal, ?, ?, default, default, ?, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			
			pstat.setInt(4, dto.getThread());
			pstat.setInt(5, dto.getDepth());
			pstat.setString(6, dto.getAttach());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	//- 목록보기
	public ArrayList<BoardDTO> list(HashMap<String, String> map) {
		
		//queryNoParamListReturn
		try {
			
			//목록보기: select * from vwBoard
			//검색하기: select * from vwBoard where 조건
			
			String where = "";
			
			if (map.get("search").equals("y")) {
				//where subject like '%검색어%'
				//where content like '%검색어%'
				//where name like '%검색어%'
				//all
				//- where subject like '%검색어%' or content like '%검색어%' or name like '%검색어%'
				
				if (!map.get("column").equals("all")) {
					where = String.format("where %s like '%%%s%%'"
										, map.get("column")
										, map.get("word"));
				} else {
					where = String.format("where subject like '%%%s%%' or content like '%%%s%%' or name like '%%%s%%'"
										, map.get("word")
										, map.get("word")
										, map.get("word"));
				}
			}
			
			//select * from (select a.*, rownum as rnum from vwBoard a) where rnum between 1 and 10
			String sql = String.format("select * from (select a.*, rownum as rnum from vwBoard a %s) where rnum between %s and %s"
										, where
										, map.get("begin")
										, map.get("end"));
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setId(rs.getString("id"));
				
				dto.setRegtime(rs.getString("regtime"));
				dto.setName(rs.getString("name"));
				dto.setIsnew(rs.getDouble("isnew"));
				
				dto.setCommentCount(rs.getString("commentCount"));
				dto.setDepth(rs.getInt("depth"));
				dto.setIng(rs.getInt("ing"));
				
				list.add(dto);
			}	
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	//- 상세보기(글 1개)
	public BoardDTO get(String seq) {
		
		//queryParamDTOReturn
		try {
			
			String sql = "select tblBoard.*, (select name from tblUser where id = tblBoard.id) as name from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
						
			if (rs.next()) {
								
				BoardDTO dto = new BoardDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				
				dto.setName(rs.getString("name"));
				
				dto.setThread(rs.getInt("thread"));
				dto.setDepth(rs.getInt("depth"));
				dto.setAttach(rs.getString("attach"));
								
				return dto;				
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	//- 조회수 증가하기
	public void updateReadcount(String seq) {
		
		//queryParamNoReturn
		try {

			String sql = "update tblBoard set readcount = readcount + 1 where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//- 수정하기
	public int edit(BoardDTO dto) {
		
		//queryParamNoReturn
		try {

			String sql = "update tblBoard set subject = ?, content = ? where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	//- 삭제하기
	public int del(String seq) {
		
		//queryParamNoReturn
		try {			

			String sql = "delete from tblBoard where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getTotalCount(HashMap<String, String> map) {
		
		//queryNoParamTokenReturn
		try {
			
			String where = "";
			
			if (map.get("search").equals("y")) {
				
				if (!map.get("column").equals("all")) {
					where = String.format("where %s like '%%%s%%'"
										, map.get("column")
										, map.get("word"));
				} else {
					where = String.format("where subject like '%%%s%%' or content like '%%%s%%' or name like '%%%s%%'"
										, map.get("word")
										, map.get("word")
										, map.get("word"));
				}
			}

			String sql = String.format("select count(*) as cnt from vwBoard %s", where);

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addComment(CommentDTO dto) {
		
		//queryParamNoReturn
		try {

			String sql = "insert into tblComment (seq, content, regdate, id, bseq) values (seqComment.nextVal, ?, default, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getId());
			pstat.setString(3, dto.getBseq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<CommentDTO> listComment(String bseq) {
		
		//queryParamListReturn
		try {
			
			String sql = "select tblComment.*, (select name from tblUser where id = tblComment.id) as name from tblComment where bseq = ? order by seq desc";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, bseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<CommentDTO> list = new ArrayList<CommentDTO>();
			
			while (rs.next()) {
				
				CommentDTO dto = new CommentDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setContent(rs.getString("content"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setId(rs.getString("id"));
				dto.setBseq(rs.getString("bseq"));
				dto.setName(rs.getString("name"));
				
				list.add(dto);
			}	
			
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int delComment(String cseq) {
		
		//queryParamNoReturn
		try {

			String sql = "delete from tblComment where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cseq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editComment(CommentDTO dto) {
		
		//queryParamNoReturn
		try {

			String sql = "update tblComment set content = ? where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getContent());
			pstat.setString(2, dto.getSeq());

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public void delCommentAll(String seq) {
		
		//queryParamNoReturn
		try {

			String sql = "delete from tblComment where bseq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int getMaxThread() {
		
		//queryNoParamTokenReturn
		try {

			String sql = "select nvl(max(thread), 0) as thread from tblBoard";

			stat = conn.createStatement();
			rs = stat.executeQuery(sql);

			if (rs.next()) {

				return rs.getInt("thread");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public void updateThread(HashMap<String, Integer> map) {
		
		//queryParamNoReturn
		try {

			String sql = "update tblBoard set thread = thread - 1 where thread > ? and thread < ?";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, map.get("previousThread"));
			pstat.setInt(2, map.get("parentThread"));

			pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int del2(String seq) {
		
		//queryParamNoReturn
		try {

			String sql = "update tblBoard set ing = 0 where seq = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public int checkDel(HashMap<String, Integer> map) {
		
		//queryParamTokenReturn
		try {

			String sql = "select count(*) as cnt from tblBoard where thread < ? and thread > (select nvl(max(thread), ?) from tblBoard  where thread < ? and depth = ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, map.get("thread"));
			pstat.setInt(2, map.get("previousThread"));
			pstat.setInt(3, map.get("thread"));
			pstat.setInt(4, map.get("depth"));

			rs = pstat.executeQuery();

			if (rs.next()) {

				return rs.getInt("cnt");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return 0;
	}

	public int addGoodBad(HashMap<String, String> map) {
		
		try {

			String sql = "insert into tblGoodBad (seq, id, bseq, state) values (seqGoodBad.nextVal, ?, ?, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("id"));
			pstat.setString(2, map.get("bseq"));
			pstat.setString(3, map.get("state"));

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return 0;
	}


	public ArrayList<HashMap<String,String>> loadGoodBad(String bseq) {
		
		try {
			
			String sql = "select state, count(*) as cnt from tblGoodBad where bseq = ? group by state";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, bseq);
			
			rs = pstat.executeQuery();
			
			ArrayList<HashMap<String,String>> list = new ArrayList<HashMap<String,String>>();
			
			while (rs.next()) {
				
				//레코드 1줄 > HashMap 1개
				HashMap<String,String> dto = new HashMap<String,String>();
				
				dto.put("state", rs.getString("state"));
				dto.put("cnt", rs.getString("cnt"));
				
				list.add(dto);				
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BoardDAO.loadGoodBad");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getGoodBad(String bseq, String id) {

		//queryParamTokenReturn
		try {

			//0, 1 > 좋아요/싫어요
			//-1 > 참여X
			
			String sql = "select state from tblGoodBad where bseq = ? and id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, bseq);
			pstat.setString(2, id);

			rs = pstat.executeQuery();

			if (rs.next()) {
				
				return rs.getString("state"); //0, 1
				
			} else {
				
				return "-1";
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public int editGoodBad(HashMap<String, String> map) {
		
		
		try {

			String sql = "update tblGoodBad set state = ? where bseq = ? and id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("state"));
			pstat.setString(2, map.get("bseq"));
			pstat.setString(3, map.get("id"));

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	public boolean checkGoodBad(HashMap<String, String> map) {
		
		try {

			String sql = "select count(*) as cnt from tblGoodBad where bseq = ? and id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, map.get("bseq"));
			pstat.setString(2, map.get("id"));
			
			rs = pstat.executeQuery();

			if (rs.next()) {

				if (rs.getInt("cnt") == 0) {
					return true;
				} else {
					return false;
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}

}

























