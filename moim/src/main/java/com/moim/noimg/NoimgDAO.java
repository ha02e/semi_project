package com.moim.noimg;

import java.sql.*;
import java.util.*;

public class NoimgDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public NoimgDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	/**QnA 글 작성 관련 메서드*/
	public int setNoimg(int idx_member, int idx_info, String subject, String content) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="insert into moim_noimg values(moim_noimg_idx.nextval,?,?,2,?,?,?,sysdate,0,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_member);
			ps.setInt(2, idx_info);
			ps.setString(3, "하니");
			ps.setString(4, subject);
			ps.setString(5, content);
			
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
	
	/**QnA 글 목록 관련 메서드*/
	public ArrayList<NoimgDTO> getQnaList(int idx_info){
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_noimg order by idx desc where idx_info=?";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ps.setInt(1, 0); //ps.setInt(1, idx_info);
			
			ArrayList<NoimgDTO> arr=new ArrayList<NoimgDTO>();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				int idx_mem=rs.getInt("idx_member");
				int category=rs.getInt("category");
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");
				
				
				NoimgDTO dto=new NoimgDTO(writer, subject, writedate);
				arr.add(dto);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				
			} catch (Exception e2) {}
		}
	}
	
}
