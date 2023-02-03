package com.moim.info;

import java.sql.*;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;

public class InfoDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public InfoDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**모임글 작성 관련 메서드*/
	public int setInfo(MultipartRequest mr, InfoDTO dto) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="insert into moim_info values(moim_info_idx.nextval, ?, ?, ?, ?, 1, ?, ?)";
			ps=conn.prepareStatement(sql);
			
			String hobby=mr.getParameter("hobby");
			String moimname=mr.getParameter("moimname");
			String content=mr.getParameter("content");
			String local=mr.getParameter("local");
			String maxmem_s=mr.getParameter("maxmem");
			int maxmem=Integer.parseInt(maxmem_s);
			String img=mr.getFilesystemName("upload");
			
			ps.setString(1, hobby);
			ps.setString(2, moimname);
			ps.setString(3, content);
			ps.setString(4, local);
			ps.setInt(5, maxmem);
			ps.setString(6, img);
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
