package com.moim.stat;

import java.sql.*;
import java.util.*;

public class StatDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public StatDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**모임 신청하기 관련 메서드*/
	public int reqMem(int idx_member, String content) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="insert into moim_stat values(moim_stat_idx.nextval,?,?,?,sysdate,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_member);
			ps.setInt(2, 0); //**idx_info 넘겨받기**
			ps.setInt(3, 2);
			ps.setString(4, content);
			
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
