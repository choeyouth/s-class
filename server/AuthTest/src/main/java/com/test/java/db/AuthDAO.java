package com.test.java.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.util.DBUtil;

public class AuthDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AuthDAO() {
		this.conn = DBUtil.open();
	}

	//LoginOk 서블릿 > id, pw > 로그인 처리
	public UserDTO login(UserDTO dto) {

		try {
			
			//예전 방식
//			String sql = "select * from tblUser where id = ?";
//			sql = "select * from tblUser where id = ? and pw = ?";
			
			//최근 방식
			String sql = "select * from tblUser where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				//로그인 성공 > 해당 유저 정보 반환
				UserDTO result = new UserDTO();
				
				result.setId(rs.getString("id"));
				result.setName(rs.getString("name"));
				result.setLv(rs.getInt("lv"));
				
				return result;
			
			}
			
		} catch (Exception e) {
			System.out.println("AuthDAO.login");
			e.printStackTrace();
		}
		
		return null;
	}
}















