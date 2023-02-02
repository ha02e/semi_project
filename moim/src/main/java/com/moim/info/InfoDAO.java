package com.moim.info;

import java.sql.*;
import java.util.*;

public class InfoDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public InfoDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**모임글 작성 관련 메서드*/
	public int setInfo(InfoDTO dto) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="insert into moim_info values(moim_info_idx.nextval, ?, ?, ?, ?, 1, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,dto.getHobby());
			ps.setString(2,dto.getMoimname());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getLocal());
			ps.setInt(5, dto.getMaxmem());
			ps.setString(6, dto.getImg());
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**모임글 콘텐츠 보여주기 관련 메서드*/
	public InfoDTO getInfo(int idx) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			InfoDTO dto=null;
			if(rs.next()) {
				String hobby=rs.getString("hobby");
				String moimname=rs.getString("moimname");
				String content=rs.getString("content");
				String local=rs.getString("local");
				int nowmem=rs.getInt("nowmem");
				int maxmem=rs.getInt("maxmem");
				String img=rs.getString("img");
				
				dto=new InfoDTO(idx, hobby, moimname, content, local, nowmem, maxmem, img);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
}
