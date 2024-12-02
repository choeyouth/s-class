package com.rebook.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.rebook.user.model.MemberDTO;
import com.rebook.user.model.MemberInfoDTO;
import com.test.util.DBUtil;

public class MemberDAO {

	public static MemberDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	private MemberDAO() {
		this.conn = DBUtil.open("localhost", "system", "oracle");
	}
	
	public static MemberDAO getInstance() {
		
		
		if (dao == null) {
			dao = new MemberDAO();
		}
		
		return dao;
		
	}
	
	public MemberDTO login(MemberDTO dto) {
		
		try {
			
			String sql = "select * from tblMember where id = ? and password = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPassword());
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				MemberDTO mdto = new MemberDTO();
				
				mdto.setSeq(rs.getString("seq"));
				mdto.setId(rs.getString("id"));
				mdto.setPassword(rs.getString("password"));
				mdto.setIng(rs.getString("ing"));
				mdto.setLv(rs.getString("lv"));
				
				return mdto;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	public MemberInfoDTO loginInfo(String memberSeq) {
		
		try {
			
			String sql = "select * from tblMemberInfo where member_seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, memberSeq);
			
			rs = pstat.executeQuery();
			
			while (rs.next()) {
				
				MemberInfoDTO idto = new MemberInfoDTO();
				idto.setSeq(rs.getString("seq"));
				idto.setName(rs.getString("Name"));
				idto.setTel(rs.getString("tel"));
				idto.setEmail(rs.getString("email"));
				idto.setPic(rs.getString("pic"));
				idto.setAddress(rs.getString("address"));
				idto.setAddrDetail(rs.getString("addrDetail"));
				idto.setZipcode(rs.getString("zipcode"));
				idto.setRegDate(rs.getString("regDate"));
				
				return idto;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}

