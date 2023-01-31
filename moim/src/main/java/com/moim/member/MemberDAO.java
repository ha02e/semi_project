package com.moim.member;

import java.sql.*;
import java.util.*;

public class MemberDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDAO() {
		
	}
	/**멤버 조회 메서드*/
	public MemberDTO getMem(int idx) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_member where moim_member_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			MemberDTO dto=null;
			if(rs.next()) {
				String name=rs.getString("name");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String local=rs.getString("local");
				int age=rs.getInt("age");
				String hobby=rs.getString("hobby");
				dto=new MemberDTO(idx, name, id, pwd, email, local, age, hobby, null, age);
			}
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**수정 메서드*/
	public int updateMem(MemberDTO dto) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="update moim_member set name=?,id=?,local=?,hobby=? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getLocal());
			ps.setString(4, dto.getHobby());
			ps.setInt(5, dto.getIdx());
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -2;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}

}
