package com.test.ajax;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.util.DBUtil;

public class AjaxDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public AjaxDAO() {
		this.conn = DBUtil.open();
	}
	
	public SurveyDTO getSurvey(int seq) {
		
		try {
			
			String sql = "select * from tblSurvey where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				
				SurveyDTO dto = new SurveyDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setQuestion(rs.getString("question"));
				dto.setItem1(rs.getString("item1"));
				dto.setItem2(rs.getString("item2"));
				dto.setItem3(rs.getString("item3"));
				dto.setItem4(rs.getString("item4"));
				dto.setCnt1(rs.getInt("cnt1"));
				dto.setCnt2(rs.getInt("cnt2"));
				dto.setCnt3(rs.getInt("cnt3"));
				dto.setCnt4(rs.getInt("cnt4"));
				
				return dto;
				
			}
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getSurvey");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getQuestion() {
		
		try {
			
			String sql = "select question from tblSurvey where seq = 1";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("question");
			}
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getQuestion");
			e.printStackTrace();
		}
		
		return null;
	}

	public int check(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblUser where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.check");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<UserDTO> listUser() {
		
		try {
			
			String sql = "select * from tblUser";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<UserDTO> list = new ArrayList<UserDTO>();
			
			//rs > (복사) > list
			while (rs.next()) {
				//레코드 1줄 > UserDTO 1개
				UserDTO dto = new UserDTO();
				
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setLv(rs.getString("lv"));
			
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.listUser");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public ArrayList<ZipcodeDTO> search(String dong) {
		
		try {
			
			String sql = "select * from zipcode"
					+ " where dong like '%' || ? || '%'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dong);
			
			rs = pstat.executeQuery();
			
			ArrayList<ZipcodeDTO> list = new ArrayList<ZipcodeDTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
				ZipcodeDTO dto = new ZipcodeDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setBunji(rs.getString("bunji"));
				dto.setZipcode(rs.getString("zipcode"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.search");
			e.printStackTrace();
		}
		
		return null;
	}

	public void editPosition(CatDTO dto) {
		
		try {
			
			String sql = "update tblCat set left = ?, top = ? where catid = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLeft());
			pstat.setString(2, dto.getTop());
			pstat.setString(3, dto.getCatid());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.editPosition");
			e.printStackTrace();
		}
		
	}

	public CatDTO getCat(String catid) {
		
		try {
			
			String sql = "select * from tblCat where catid = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, catid);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				CatDTO dto = new CatDTO();
				dto.setCatid(rs.getString("catid"));
				dto.setLeft(rs.getString("left"));
				dto.setTop(rs.getString("top"));
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getCat");
			e.printStackTrace();
		}
		
		return null;
	}

	public void addCat(String catid) {
		
		try {
			
			String sql = "insert into tblCat values (?, 0, 0)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, catid);

			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.addCat");
			e.printStackTrace();
		}
		
	}

	public int getMaxSeq() {

		try {
			
			String sql = "select max(to_number(substr(catid, 4))) from tblCat";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				//cat10 > cat11
				return rs.getInt(1);
			}
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.getMaxSeq");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<CatDTO> listCat() {
		
		try {
			
			String sql = "select * from tblCat";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CatDTO> list = new ArrayList<CatDTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
				CatDTO dto = new CatDTO();
				dto.setCatid(rs.getString("catid"));
				dto.setLeft(rs.getString("left"));
				dto.setTop(rs.getString("top"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.listCat");
			e.printStackTrace();
		}
		
		return null;
	}

	public int addAddress(AddressDTO dto) {
		
		try {
			
			String sql = "insert into tblAddress values (seqAddress.nextVal, ?, ?, ?, ?, ?, default)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAge());
			pstat.setString(3, dto.getGender());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getAddress());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.addAddress");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<AddressDTO> listAddress() {
		
		try {
			
			String sql = "select * from tblAddress order by seq asc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			
			ArrayList<AddressDTO> list = new ArrayList<AddressDTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
				AddressDTO dto = new AddressDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getString("age"));
				dto.setGender(rs.getString("gender"));
				dto.setTel(rs.getString("tel"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setAddress(rs.getString("address"));
				list.add(dto);
			}

			return list;
 			
		} catch (Exception e) {
			System.out.println("AjaxDAO.listAddress");
			e.printStackTrace();
		}
		 
		return null;
	}

	public int delAddress(String seq) {
		
		try {
			
			String sql = "delete from tblAddress where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.delAddress");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int editAddress(AddressDTO dto) {
		
		try {
			
			String sql = "update tblAddress set name = ?, age = ?, gender = ?, tel = ?, address = ? where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getAge());
			pstat.setString(3, dto.getGender());
			pstat.setString(4, dto.getTel());
			pstat.setString(5, dto.getAddress());
			pstat.setString(6, dto.getSeq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("AjaxDAO.editAddress");
			e.printStackTrace();
		}
		
		return 0;
	}
}
