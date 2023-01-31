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
	/**멤버 게시판 조회 관련 메서드*/
	public ArrayList<InfoDTO> getList(String userhobby){
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info ";
			if(!userhobby.equals("total")) {
				sql=sql+"where hobby=?";
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
	/**게시물 총 개수 검색 관련 메서드*/
	public int getTotalCnt() {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select count(*) from moim_info";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count==0?1:count;
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
	/**기본 검색 관련 메서드*/
	public ArrayList<InfoDTO> searchInfo(String keyword){
		try {
			keyword=keyword.replace(" ","");
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<InfoDTO> arr=new ArrayList<InfoDTO>();
			while(rs.next()) {
				String moimname=rs.getString("moimname");
				String moimname_c=moimname.replace(" ", "");
				if(!moimname_c.contains(keyword)) {
					continue;
				}
				int idx=rs.getInt("idx");
				String hobby=rs.getString("hobby");
				String local=rs.getString("local");
				int nowmem=rs.getInt("nowmem");
				int maxmem=rs.getInt("maxmem");
				String img=rs.getString("img");
				InfoDTO dto=new InfoDTO(idx, hobby, moimname, null, local, nowmem, maxmem, img);
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
	/**키워드가 있을때 세부 검색 관련 메서드*/
	public ArrayList<InfoDTO> searchDetailNoKey(String userhobby[],String userlocal,String keyword){
		try {
			keyword=keyword.replace(" ","");
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info where ";
			ArrayList<InfoDTO> arr=new ArrayList<InfoDTO>();
			if(userhobby!=null) {		// hobby O
				if(!userlocal.equals("전체")) {
					sql=sql+"local='"+userlocal+"' and ";
				}
				sql=sql+"hobby=?";
				ps=conn.prepareStatement(sql);
				for(int i=0;i<userhobby.length;i++) {
					ps.setString(1, userhobby[i]);
					rs=ps.executeQuery();
					while(rs.next()) {
						String moimname=rs.getString("moimname");
						String moimname_c=moimname.replace(" ", "");
						int nowmem=rs.getInt("nowmem");
						int maxmem=rs.getInt("maxmem");
						if(!moimname_c.contains(keyword)&&nowmem>=maxmem) {
							continue;
						}
						int idx=rs.getInt("idx");
						String hobby=userhobby[i];
						String local=rs.getString("local");
						String img=rs.getString("img");
						InfoDTO dto=new InfoDTO(idx, hobby, moimname, null, local, nowmem, maxmem, img);
						arr.add(dto);
					}
				}
			}else if(userhobby==null){//hobby X local O
				sql=sql+"local='"+userlocal+"'";
				rs=ps.executeQuery();
				while(rs.next()) {
					String moimname=rs.getString("moimname");
					String moimname_c=moimname.replace(" ","");
					int nowmem=rs.getInt("nowmem");
					int maxmem=rs.getInt("maxmem");
					if(!moimname_c.contains(keyword)&&nowmem>=maxmem) {
						continue;
					}
					int idx=rs.getInt("idx");
					String hobby=rs.getString("hobby");
					String local=rs.getString("local");
					String img=rs.getString("img");
					InfoDTO dto=new InfoDTO(idx, hobby, moimname, null, local, nowmem, maxmem, img);
					arr.add(dto);
				}
				
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
	/**키워드가 없을때 세부검색*/
	public ArrayList<InfoDTO> searchDeatilInKey(String userhobby[], String userlocal){
		try {
			conn=com.moim.db.MoimDB.getConn();
			ArrayList<InfoDTO> arr=new ArrayList<InfoDTO>();
			String sql="select * from moim_info where ";
			if(userhobby!=null) {		//hobby O
				if(!userlocal.equals("전체")) {
					sql=sql+"local='"+userlocal+"' and ";
				}
				sql=sql+"hobby=?";
				ps=conn.prepareStatement(sql);
				for(int i=0;i<userhobby.length;i++) {
					ps.setString(1, userhobby[i]);
					rs=ps.executeQuery();
					while(rs.next()) {
						int nowmem=rs.getInt("nowmem");
						int maxmem=rs.getInt("maxmem");
						if(nowmem>=maxmem) {
							continue;
						}
						String moimname=rs.getString("moimname");
						int idx=rs.getInt("idx");
						String hobby=userhobby[i];
						String local=rs.getString("local");
						String img=rs.getString("img");
						InfoDTO dto=new InfoDTO(idx, hobby, moimname, null, local, nowmem, maxmem, img);
						arr.add(dto);
					}
				}
			}else if(userhobby==null){//hobby X local O
				sql=sql+"local='"+userlocal+"'";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				while(rs.next()) {
					int nowmem=rs.getInt("nowmem");
					int maxmem=rs.getInt("maxmem");
					if(nowmem>=maxmem) {
						continue;
					}
					String moimname=rs.getString("moimname");
					int idx=rs.getInt("idx");
					String hobby=rs.getString("hobby");
					String local=rs.getString("local");
					String img=rs.getString("img");
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
				
			}catch(Exception e2) {}
		}
	}
}





























