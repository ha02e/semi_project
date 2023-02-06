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
	/**이름 가져오는 메서드
	 * 해쉬맵이름.get(idx_member) 하면 이름나옴*/
	public HashMap<Integer,String> getName(){
		try {
			conn=com.moim.db.MoimDB.getConn();
			HashMap<Integer,String> hm=new HashMap<Integer,String>();
			String sql="select idx,name from moim_member";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				int idx=rs.getInt(1);
				String name=rs.getString(2);
				hm.put(idx, name);
			}
			return hm;
		}catch (Exception e){
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2){}
		}
	}
	/**모임 인원 총 개수 가져오는 메서드*/
	public int getTotalCnt(int idx_info,int stat) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select count(*) from moim_stat where idx_info=? and stat=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_info);
			ps.setInt(2, stat);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count>1?count:1;
		}catch(Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	
	/**모임 인원 관리 신청자,참여자 가져오는 메서드
	 * 매개변수로 모임의 idx, 참여자인지 신청자인지 여부, ls, cp 들어감*/
	public ArrayList<StatDTO> getNewPerStatList(int idx_info, int stat,int ls,int cp){
		try {
			conn=com.moim.db.MoimDB.getConn();
			ArrayList<StatDTO> arr=new ArrayList<StatDTO>();
			int start=(cp-1)*ls+1;
	        int end=(cp*ls);
			String sql="select * from (select rownum as rnum,a.* from (select * from moim_stat where idx_info=? and stat=? order by idx)a)b  where rnum>=? and rnum<=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_info);
			ps.setInt(2, stat);
			ps.setInt(3, start);
			ps.setInt(4, end);
			while(rs.next()) {
				int idx=rs.getInt("idx");
				int idx_member=rs.getInt("idx_member");
				java.sql.Date joindate=rs.getDate("joindate");
				String contet=rs.getString("content");
				StatDTO dto=new StatDTO(idx, idx_member, idx_info, stat, joindate, contet);
				arr.add(dto);
			}
			return arr;
			
		}catch(Exception e){
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
	/**모임이 꽉 찼는지 인원 확인 메서드 
	 * 매개변수= 체크할 모임의 idx
	 * 리턴값 true=아직 여유자리 있음 false=꽉참*/
	public boolean checkMem(int idx_info) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select nowmem,maxmem from moim_info";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			if(rs.getInt(1)<rs.getInt(2))return true;
			else return false;
		}catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)ps.close();
			}catch(Exception e2) {}
		}
	}
	/**멤버 수락하는 메서드*/
	public int inMem(int idx) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="update moim_stat set stat=1 where idx=?";
			ps=conn.prepareStatement(sql);
			int count=ps.executeUpdate();
			/**moim_info에서 멤버 추가
			 * nownum을 +1*/
			return count;
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2){}
		}
	}
	/**멤버 거절하는 메서드*/
	public int outMem(int idx) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="delete from moim_stat where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**멤버 수 확인 메서드*/
	public int getMemNum(int idx_info) {
		try {
			String sql="select nowmem from moim_info where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_info);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count;
		}catch (Exception e	) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			}catch (Exception e2) {}
		}
	}
	/**멤버 탈퇴하는 메서드*/
	public int delMem(int idx,int idx_info) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			int nowmem=getMemNum(idx_info);
			String sql="delete from moim_stat where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.executeUpdate();
			sql="update moim_info set nowmem=? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, nowmem-1);
			ps.setInt(2, idx_info);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2) {}
		}
	}
	/**멤버 내용보기 관련 메서드*/
	public StatDTO getStatContent(int idx) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_stat where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			rs.next();
			int idx_member=rs.getInt("idx_member");
			int idx_info=rs.getInt("idx_info");
			java.sql.Date joindate=rs.getDate("joindate");
			String content=rs.getString("content");
			StatDTO dto=new StatDTO(idx, idx_member, idx_info, 2, joindate, content);
			return dto;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {}
		}
	}
}























