package com.test.memo.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.memo.model.MemoDTO;
import com.test.util.DBUtil;

//DB 관련 코드 담당 > JDBC 코드 담당
//(파일 입출력 코드 등 다른 데이터 조작 코드를 넣을 수 있음)
public class MemoDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	//생성자
	public MemoDAO() {
		//MemoDAO 객체 생성 > DB 접속
		conn = DBUtil.open();
	}

	//AddOk 서블릿이 입력 데이터를 줄테니 DB에 insert 해달라고 요청
	public int add(MemoDTO dto) {
		
		try {
			
			//DB연결 이미 되어 있음 > 쿼리 날리기
			String sql = "insert into tblMemo (seq, name, pw, memo, regdate) values (seqMemo.nextVal, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getMemo());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemoDAO.add");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//List 서블릿이 메모 목록을 주세요~ 
	public ArrayList<MemoDTO> list() {
		
		try {
			
			String sql = "select * from tblMemo order by seq desc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql); //메모 목록
			
			//ResultSet(rs) > (변환) > ArrayList<MemoDTO>
			ArrayList<MemoDTO> list = new ArrayList<MemoDTO>();
			
			while (rs.next()) {
				
				//레코드 1줄 > MemoDTO 1개씩 생성
				MemoDTO dto = new MemoDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setMemo(rs.getString("memo"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("MemoDAO.list");
			e.printStackTrace();
		}
		
		
		return null;
	}

	//Edit  서블릿이 메모 번호를 줄테니 게시물 정보(DTO)를 알려다오~
	public MemoDTO get(String seq) {
		
		try {
			
			String sql = "select * from tblMemo where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				MemoDTO dto = new MemoDTO();
				dto.setMemo(rs.getString("memo"));
				dto.setName(rs.getString("name"));
				dto.setSeq(rs.getString("seq")); //PK
				
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("MemoDAO.get");
			e.printStackTrace();
		}
		
		return null;
	}

	//EditOk 서블릿이 수정된 메모를 줄테니 update 해주세요~
	public int edit(MemoDTO dto) {

		try {
			
			String sql = "update tblMemo set memo = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getMemo());
			pstat.setString(2, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MemoDAO.edit");
			e.printStackTrace();
		}
		
		return 0;
	
	}

	//EditOk 서블릿이 메모를 수정하기 전에 권한이 있는지 확인?
	public int check(MemoDTO dto) {
		
		try {
			
			String sql = "select count(*) as cnt from tblMemo where seq = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("MemoDAO.check");
			e.printStackTrace();
		}
		
		return 0;
	}

	
	//DelOk 서블릿이 메모를 삭제해주세요~
	public int del(MemoDTO dto) {

		try {
			
			String sql = "delete from tblMemo where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("MemoDAO.del");
			e.printStackTrace();
		}
		
		return 0;
	}
	
}
