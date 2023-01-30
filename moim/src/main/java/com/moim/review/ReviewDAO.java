package com.moim.review;

import java.sql.*;
import java.util.*;

public class ReviewDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public ReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	/** 마지막 ref 구하기 ㅣ관련 메서드 */
	public int getMaxRef() {
		try {
			String sql="select max(ref) from moim_review";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()) {
				max=rs.getInt(1);
			}
			return max;
					
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {

			}
		}
	}
	/** 글쓰기 관련 메서드 */

	public int reviewWrite(ReviewDTO dto) {
		try {
			conn = com.moim.db.MoimDB.getConn();
			
			int maxref=getMaxRef();
			String sql = "insert into moim_review values(moim_review_idx.nextval,?,?,?,?,?,?,?,sysdate,?,0)";
			ps = conn.prepareStatement(sql);
//			ps.setInt(1, dto.getIdx_member());
			ps.setString(1, dto.getMoimname());
			ps.setString(2, dto.getLocal());
			ps.setString(3, dto.getHobby());
			ps.setString(4, dto.getWriter());
			ps.setString(5, dto.getSubject());
			ps.setString(6, dto.getContent());
			ps.setString(7, dto.getImg());
			ps.setInt(8, maxref+1);
			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}
	
}
