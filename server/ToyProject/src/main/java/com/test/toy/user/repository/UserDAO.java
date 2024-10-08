package com.test.toy.user.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.test.toy.user.model.UserDTO;
import com.test.util.DBUtil;

public class UserDAO {

	public static UserDAO dao;
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
//	public UserDAO() {
//		this.conn = DBUtil.open("localhost", "toy", "java1234");
//	}
	
	private UserDAO() {
		//외부에서 객체를 만들지 못하게 함
		this.conn = DBUtil.open("localhost", "toy", "java1234");
	}
	
	//객체를 대신 만들어주는 메서드
	public static UserDAO getInstance() {
		
		
		if (dao == null) {
			dao = new UserDAO();
		}
		
		return dao;
		
	}

	public int register(UserDTO dto) {
		
		try {
			
			String sql = "insert into tblUser (id, pw, name, email, lv, pic, intro, regdate, ing) values (?, ?, ?, ?,  1, ?, ?, default, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getName());
			pstat.setString(4, dto.getEmail());
			pstat.setString(5, dto.getPic());
			pstat.setString(6, dto.getIntro());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserDAO.register");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int unregister(String id) {
		
		//queryParamNoReturn
		try {

			String sql = "update tblUser set pw = '0000', name = '탈퇴', email = '탈퇴', pic = default, intro = null, ing = 0 where id = ?";

			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);

			return pstat.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	
	//로그인
	public UserDTO login(UserDTO dto) {
		
		//queryPramDTOReturn
		try {
			
			String sql = "select * from tblUser where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				UserDTO result = new UserDTO();
				
				result.setId(rs.getString("id"));
				result.setPw(rs.getString("pw"));
				result.setName(rs.getString("name"));
				result.setEmail(rs.getString("email"));
				result.setLv(rs.getString("lv"));
				result.setPic(rs.getString("pic"));
				result.setIntro(rs.getString("intro"));
				result.setRegdate(rs.getString("regdate"));
				result.setIng(rs.getString("ing"));
				
				return result;				
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
