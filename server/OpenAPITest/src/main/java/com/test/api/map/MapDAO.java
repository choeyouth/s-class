package com.test.api.map;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.test.api.food.CategoryDTO;
import com.test.api.food.FoodDTO;
import com.test.util.DBUtil;

public class MapDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MapDAO() {
		this.conn = DBUtil.open();
	}

	public ArrayList<MapDTO> list() {
		
		try {
			
			String sql = "select * from tblMarker";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<MapDTO> list = new ArrayList<MapDTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
				MapDTO dto = new MapDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("MapDAO.list");
			e.printStackTrace();
		} 
	
		
		
		return null;
	}

	public void add(MapDTO dto) {

		try {
			
			String sql = "insert into tblMarker (seq, lat, lng) values (seqMarker.nextVal, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getLat());
			pstat.setString(2, dto.getLng());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MapDAO.add");
			e.printStackTrace();
		}
		
	}

	public ArrayList<CategoryDTO> clist() {
		
		try {
			
			String sql = "select * from tblCategory order by seq asc";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
			
			while (rs.next()) {
				//레코드 1줄 > DTO 1개
				CategoryDTO dto = new CategoryDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setImg(rs.getString("img"));
				
				System.out.println(rs.getString("seq"));
				
				list.add(dto);
			
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("MapDAO.clist");
			e.printStackTrace();
		}
		
		return null;
	}

	public int addFood(FoodDTO dto) {

		try {
			
			String sql = "insert into tblFood (seq, name, lat, lng, category, address, star, menu) values (seqFood.nextVal, ?, ?, ?, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getName());
			pstat.setString(2, dto.getLat());
			pstat.setString(3, dto.getLng());
			pstat.setString(4, dto.getCategory());
			pstat.setString(5, dto.getAddress());
			pstat.setString(6, dto.getStar());
			pstat.setString(7, dto.getMenu());
			
			System.out.println(dto.getAddress());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("MapDAO.addFood");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<FoodDTO> listFood() {
		
		try {
			
			//Food + Category
			String sql = "select f.seq as fseq, f.name as fname, f.lat, f.lng, f.address, f.star, f.menu, c.seq as cseq, c.name as cname, c.img from tblFood f inner join tblCategory c on c.seq = f.category order by f.seq desc";
			
			pstat = conn.prepareStatement(sql);
			rs = pstat.executeQuery(sql);
			
			ArrayList<FoodDTO> list = new ArrayList<FoodDTO>();
			
			while (rs.next()) {
				FoodDTO dto = new FoodDTO();
				dto.setSeq(rs.getString("fseq"));
				dto.setName(rs.getString("fname"));
				dto.setLat(rs.getString("lat"));
				dto.setLng(rs.getString("lng"));
				dto.setAddress(rs.getString("address"));
				dto.setStar(rs.getString("star"));
				dto.setMenu(rs.getString("menu"));
				
				CategoryDTO cdto = new CategoryDTO();
				cdto.setSeq(rs.getString("cseq"));
				cdto.setName(rs.getString("cname"));
				cdto.setImg(rs.getString("img"));
				
				dto.setCategoryDTO(cdto);
				list.add(dto);
			
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("MapDAO.listFood");
			e.printStackTrace();
		}
		
		return null;
	}
}
