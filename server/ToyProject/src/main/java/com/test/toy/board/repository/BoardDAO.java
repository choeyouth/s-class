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

public class BoardDAO {

	public static BoardDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	private BoardDAO() {
		//외부에서 객체를 만들지 못하게 함
		this.conn = DBUtil.open("localhost", "toy", "java1234");
	}
	
	//객체를 대신 만들어주는 메서드
	public static BoardDAO getInstance() {
		if (dao == null) {
			dao = new BoardDAO();
		}
		return dao;
	}

	//- 글쓰기
	//- 목록 보기
	//- 상세보기(글 1개)
	//- 조회수 증가하기
	//- 수정하기
	//- 삭제하기
	
	
	//- 글쓰기
	public int add(BoardDTO dto) {
		
		try {

			String sql = "insert into tblBoard (seq, subject, content, regdate, readcount, id) values(seqBoard.nextVal, ?, ?, default, default, ?)";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSubject());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getId());
			
			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//- 목록 보기
	public ArrayList<BoardDTO> list(HashMap<String,String> map) {
		
		try {
			
			//목록보기: select * form vwBoard
			//검색하기: select * form vwBoard where 조건 
			
			String where = "";
			
			if (map.get("search").equals("y")) {
				//where subject like '%검색어%'
				//where content lile '%검색어%'
				//where name = like '%검색어%'
				//where all = like '%검색어%'
				//- where subject like '%검색어%' or 
				//  where content lile '%검색어%' or
				//  where name = like '%검색어%'
				
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
			
			// select * from (select a.*, rownum as rnum from vwBoard a)
		    // where rnum between 1 and 10;
			String sql = String.format("select * from (select a.*, rownum as rnum from vwBoard a %s) where rnum between %s and %s "
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
		
		try {
					
			String sql = "select tblBoard.*, (select name from tblUser where id = tblBoard.id) as name from tblBoard where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				
				return dto;				
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	//- 조회수 증가하기
	public void updateReadcount(String seq) {
		
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

	public int getTotalCout(HashMap<String,String> map) {

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
		
		try {

			String sql = "insert into tblComment (seq, content, regdate, id, bseq) values(seqComment.nextVal, ?, default, ?, ?)";

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
		
		try {
			
			String sql = "delete from tblComment where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, cseq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BoardDAO.delComment");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editComment(CommentDTO dto) {
		
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
}
