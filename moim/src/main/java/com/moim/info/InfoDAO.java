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
	
	public ArrayList<InfoDTO> getList(String userhobby){
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info";
			if(!userhobby.equals("total")) {
				sql=sql+" where hobby=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, userhobby);
			}else {
				ps=conn.prepareStatement(sql);
			}
			rs=ps.executeQuery();
			ArrayList<InfoDTO> arr=new ArrayList<InfoDTO>();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String hobby=rs.getString("hobby");
				String moimname=rs.getString("moimname");
				String local=rs.getString("local");
				String img=rs.getString("img");
				int nowmem=rs.getInt("nowmem");
				int maxmem=rs.getInt("maxmem");
				if(maxmem>nowmem) {
				InfoDTO dto=new InfoDTO(idx, hobby, moimname, null, local, nowmem, maxmem, img);
				arr.add(dto);
				}
			}
			return arr;
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
		
	}
}
