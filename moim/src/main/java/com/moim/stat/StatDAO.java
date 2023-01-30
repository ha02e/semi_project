package com.moim.stat;

import java.sql.*;

public class StatDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public StatDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public String test() {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from emp";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			String str=rs.getString(1);
			return str;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				
			}catch(Exception e2) {}
		}
		
	}
}
