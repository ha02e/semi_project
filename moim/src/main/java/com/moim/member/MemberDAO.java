package com.moim.member;

import com.moim.noimg.*;
import com.moim.info.*;
import com.moim.review.*;
import java.sql.*;
import java.util.*;

import com.moim.review.ReviewDTO;

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
			String sql="update moim_member set name=?,id=?,pwd=?,email=?,local=?,age=?,hobby=? where moim_member_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getLocal());
			ps.setInt(6, dto.getAge());
			ps.setString(7, dto.getHobby());
			ps.setInt(8, dto.getIdx());
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
	/**댓글 조회 메서드*/
	public ArrayList<NoimgDTO> getMyQna(int category,int idx_member){
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_noimg where category=? and idx_member=?";
			ps=conn.prepareStatement(sql);
			ArrayList<NoimgDTO> arr=new ArrayList<NoimgDTO>();
			ps.setInt(1, category);
			ps.setInt(2, idx_member);
			rs=ps.executeQuery();
			while(rs.next()) {
				int idx_info=rs.getInt("idx_info");
				int idx=rs.getInt("idx");
				String writer=rs.getString("writer");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				java.sql.Date writedate=rs.getDate("writedate");
				int ref=rs.getInt("ref");
				int lev=rs.getInt("lev");
				int sunbun=rs.getInt("sunbun");
				
				NoimgDTO dto=new NoimgDTO(idx, idx_member, idx_info, category, writer, subject, content, writedate, ref, lev, sunbun);
				arr.add(dto);
			}
			return arr;
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
	/**후기 조회 메서드*/
	public ArrayList<ReviewDTO> getMyReview(int category,int idx_member){
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_review where category=? and idx_member=?";
			ps=conn.prepareStatement(sql);
			ArrayList<ReviewDTO> arr=new ArrayList<ReviewDTO>();
			ps.setInt(1, category);
			ps.setInt(2, idx_member);
			rs=ps.executeQuery();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String moimname=rs.getString("moimname");
				String writer=rs.getString("writer");
				String local=rs.getString("local");
				String hobby=rs.getString("hobby");
				String subject=rs.getString("subject");
				String content=rs.getString("content");
				String img=rs.getString("img");
				java.sql.Date writedate=rs.getDate("writedate");
				
				ReviewDTO dto=new ReviewDTO(idx, idx_member, moimname, writer, local, hobby, subject, content, img, writedate);
				arr.add(dto);
			}
			return arr;
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
	
	/**모임이름 가져오기 메서드*/
	public HashMap<Integer, String> moimName(){
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from ";
			ps=conn.prepareStatement(sql);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
			}catch(Exception e2) {}
		}
	}
	
	
//	/**탈퇴하기 메서드*/
//	public int dropMem(int idx) {
//		try {
//			conn=com.moim.db.MoimDB.getConn();
//			String sql="delete from ";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, idx);
//			int count=ps.executeUpdate();
//			return count;
//		}catch(Exception e) {
//			e.printStackTrace();
//			return -1;
//		}finally {
//			try {
//				if(ps!=null)ps.close();
//				if(conn!=null)conn.close();
//			}catch(Exception e2) {}
//		}
//	}

}
