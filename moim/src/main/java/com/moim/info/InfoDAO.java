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
	

	
}
