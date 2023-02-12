package com.moim.info;

import java.sql.*;
import java.util.*;

import com.oreilly.servlet.MultipartRequest;

public class InfoDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public InfoDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**모임글 작성 관련 메서드*/
	public int setInfo(MultipartRequest mr, InfoDTO dto) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="insert into moim_info values(moim_info_idx.nextval, ?, ?, ?, ?, 1, ?, ?)";
			ps=conn.prepareStatement(sql);
			
			String hobby=mr.getParameter("hobby");
			String moimname=mr.getParameter("moimname");
			String content=mr.getParameter("content");
			String local=mr.getParameter("local");
			String maxmem_s=mr.getParameter("maxmem");
			int maxmem=Integer.parseInt(maxmem_s);
			String img=mr.getFilesystemName("upload");
			
			ps.setString(1, hobby);
			ps.setString(2, moimname);
			ps.setString(3, content);
			ps.setString(4, local);
			ps.setInt(5, maxmem);
			ps.setString(6, img);
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
	
	/**모임글 작성후 Stat에 관리자 추가하는 메서드*/
	public int setManager(int idx_member) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="insert into moim_stat values(moim_stat_idx.nextval,?,moim_info_idx.currval,0,sysdate,'')";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx_member);

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
	
	/**모임글 콘텐츠 보여주기 관련 메서드*/
	public InfoDTO getInfo(int idx) {
		try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			InfoDTO dto=null;
			if(rs.next()) {
				String hobby=rs.getString("hobby");
				String moimname=rs.getString("moimname");
				String content=rs.getString("content");
				String local=rs.getString("local");
				int nowmem=rs.getInt("nowmem");
				int maxmem=rs.getInt("maxmem");
				String img=rs.getString("img");
				
				dto=new InfoDTO(idx, hobby, moimname, content, local, nowmem, maxmem, img);
			}
			return dto;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
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
	   /**세부검색 게시물 총 개수 검색 관련 메서드*/
	   public int getTotalCntDeatil(String userhobby[],String keyword,String userlocal) {
	      try {
	         conn=com.moim.db.MoimDB.getConn();
	         String sql="select count(*) from moim_info where nowmem<maxmem ";
	         if(userhobby!=null) {
	            sql=sql+"and hobby in(";
	            for(int i=0;i<userhobby.length;i++) {
	               if(i!=0)sql=sql+",";
	               sql=sql+"'"+userhobby[i]+"'";
	            }
	            sql=sql+") ";
	         }
	         if(!userlocal.equals("전체")) {
	            sql=sql+"and local='"+userlocal+"' ";
	         }
	         if(keyword!=null) {
	            keyword="%"+keyword.replace(" ", "%")+"%";
	            sql=sql+"and moimname like ?";
	            ps=conn.prepareStatement(sql);
	            ps.setString(1, keyword);
	         }else {
	            ps=conn.prepareStatement(sql);
	         }
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
	   public ArrayList<InfoDTO> searchInfo(String keyword,int ls,int cp){
	      try {
	         keyword="%"+keyword.replace(" ","%")+"%";
	         conn=com.moim.db.MoimDB.getConn();
	         int start=(cp-1)*ls+1;
	         int end=(cp*ls);
	         String sql="select * from (select rownum as rnum,a.* from (select * from moim_info where nowmem<maxmem and moimname like ? order by idx)a)b  where rnum>=? and rnum<=?";
	         ArrayList<InfoDTO> arr=new ArrayList<InfoDTO>();
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, keyword);
	         ps.setInt(2, start);
	         ps.setInt(3, end);
	         rs=ps.executeQuery();
	         while(rs.next()) {
	            String moimname=rs.getString("moimname");
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
	   public ArrayList<InfoDTO> searchDetailInKey(String userhobby[],String userlocal,String keyword,int ls,int cp){
	      try {
	         keyword="%"+keyword.replace(" ","%")+"%";
	         conn=com.moim.db.MoimDB.getConn();
	         int start=(cp-1)*ls+1;
	         int end=(cp*ls);
	         ArrayList<InfoDTO> arr=new ArrayList<InfoDTO>();
	         String sql="select * from (select rownum as rnum,a.* from (select * from moim_info where nowmem<maxmem and moimname like ? and ";
	         if(userhobby!=null) {
	            if(!userlocal.equals("전체")) {
	               sql=sql+"local='"+userlocal+"' and ";
	            }
	            sql=sql+"hobby in(";
	            for(int i=0;i<userhobby.length;i++) {
	               if(i!=0)sql=sql+",";
	               sql=sql+"'"+userhobby[i]+"'";
	            }
	            sql=sql+") order by idx)a)b  where rnum>=? and rnum<=?";
	         }else {
	            sql=sql+"local='"+userlocal+"' order by idx)a)b  where rnum>=? and rnum<=?";
	         }
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, keyword);
	         ps.setInt(2, start);
	         ps.setInt(3, end);
	         rs=ps.executeQuery();
	         while(rs.next()) {
	            String moimname=rs.getString("moimname");
	            int nowmem=rs.getInt("nowmem");
	            int maxmem=rs.getInt("maxmem");
	            int idx=rs.getInt("idx");
	            String hobby=rs.getString("hobby");
	            String local=rs.getString("local");
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
	   /**키워드가 없을때 세부검색*/
	   public ArrayList<InfoDTO> searchDeatilNoKey(String userhobby[], String userlocal,int ls, int cp){
	      try {
	         conn=com.moim.db.MoimDB.getConn();
	         ArrayList<InfoDTO> arr=new ArrayList<InfoDTO>();
	         int start=(cp-1)*ls+1;
	         int end=(cp*ls);
	         String sql="select * from (select rownum as rnum,a.* from (select * from moim_info where nowmem<maxmem and ";
	         if(userhobby!=null) { //hobby O local O,X
	            if(!userlocal.equals("전체")) {
	               sql=sql+"local='"+userlocal+"' and ";
	            }
	            sql=sql+"hobby in(";
	            for(int i=0;i<userhobby.length;i++) {
	               if(i!=0)sql=sql+",";
	               sql=sql+"'"+userhobby[i]+"'";
	            }
	            sql=sql+") order by idx)a)b  where rnum>=? and rnum<=?";
	         }else { //hobby X local O
	            sql=sql+"local='"+userlocal+"' order by idx)a)b  where rnum>=? and rnum<=?";
	         }
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, start);
	         ps.setInt(2, end);
	         rs=ps.executeQuery();
	         while(rs.next()) {
	            String moimname=rs.getString("moimname");
	            int nowmem=rs.getInt("nowmem");
	            int maxmem=rs.getInt("maxmem");
	            int idx=rs.getInt("idx");
	            String hobby=rs.getString("hobby");
	            String local=rs.getString("local");
	            String img=rs.getString("img");
	            InfoDTO dto=new InfoDTO(idx, hobby, moimname, null, local, nowmem, maxmem, img);
	            arr.add(dto);
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
	         }catch(Exception e2) {}
	      }
	   }
	   
	   /**모임 수정용 조회 관련 메서드*/
	   public InfoDTO getMoimCon(int idx) {
		   try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			InfoDTO dto=null;
			if(rs.next()) {
				String hobby=rs.getString("hobby");
				String moimname=rs.getString("moimname");
				String content=rs.getString("content");
				String local=rs.getString("local");
				int nowmem=rs.getInt("nowmem");
				int maxmem=rs.getInt("maxmem");
				String img=rs.getString("img");
				
				dto=new InfoDTO(idx, hobby, moimname, content, local, nowmem, maxmem, img);
			}
				return dto;
				
		} catch (Exception e) {
				e.printStackTrace();
				return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	   }
	   
	   /** 모임 수정용 이미지 가져오기 관련 메서드 */
	   public String getAdrImg(int idx) {
		   try {
			conn=com.moim.db.MoimDB.getConn();
			String sql="select * from moim_info where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			rs.next();
			String adr=rs.getString("img");
			
			return adr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		   
	   } 
	   
		/**모임글 수정 관련 메서드*/
		public int updateInfo(MultipartRequest mr, InfoDTO dto, int idx) {
			try {
				conn=com.moim.db.MoimDB.getConn();
				String sql="update moim_info set hobby=?, moimname=?, content=?, local=?, maxmem=?, img=? where idx=?";
				ps=conn.prepareStatement(sql);
				
				String hobby=mr.getParameter("hobby");
				String moimname=mr.getParameter("moimname");
				String content=mr.getParameter("content");
				String local=mr.getParameter("local");
				String maxmem_s=mr.getParameter("maxmem");
				int maxmem=Integer.parseInt(maxmem_s);
				String img=mr.getFilesystemName("upload");
				int idx_i=Integer.parseInt((mr.getParameter("idx")));
				
				ps.setString(1, hobby);
				ps.setString(2, moimname);
				ps.setString(3, content);
				ps.setString(4, local);
				ps.setInt(5, maxmem);
				ps.setString(6, img);
				ps.setInt(7, idx_i);
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
		/**모임 삭제하는 매서드*/
		public int delInfo(int idx_info) {
			try {
				conn=com.moim.db.MoimDB.getConn();
				String sql="delete from moim_info where idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx_info);
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		/**모임 삭제 이후에 stat에서 데이터 지우는 매서드*/
		public int delStat(int idx_info) {
			try {
				conn=com.moim.db.MoimDB.getConn();
				String sql="delete from moim_stat where idx_info=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx_info);
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}	
		/**모임 삭제 이후 QnA 게시판에서 삭제하는 메서드*/
		public int delQna(int idx_info) {
			try {
				conn=com.moim.db.MoimDB.getConn();
				String sql="delete from moim_noimg where idx_info=? and category in(2,3)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx_info);
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch( Exception e2) {}
			}
		}
}
