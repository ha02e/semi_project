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
<<<<<<< HEAD
	
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
=======
	public String test() {
		try {
			conn=com.moim.db.MoimDB.getConn();
		String sql="Select * from emp";
		ps=conn.prepareStatement(sql);
		rs=ps.executeQuery();
		rs.next();
		String str = rs.getString(1);
		return str;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				
			}catch(Exception e2) {
				
			}
		}
	}

>>>>>>> 5047a854d50bf4a41a034a2f6436483f62acfdb9
}
