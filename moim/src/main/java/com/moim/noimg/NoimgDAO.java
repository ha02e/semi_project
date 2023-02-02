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
   
   /** 마지막 ref 구하기 관련 메서드 */
   public int getMaxRef() {
      try {
         String sql="select max(ref) from moim_noimg";
         ps=conn.prepareStatement(sql);
         rs=ps.executeQuery();
         
         int max=0;
         if(rs.next()) {
            max=rs.getInt("max(ref)");
         }
         return max;
      } catch (Exception e) {
         e.printStackTrace();
         return 0;
      }finally {
         try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
         } catch (Exception e2) {}
      }
   }
   
   /**QnA 글 작성 관련 메서드*/
   public int setNoimg(int idx_member, int idx_info, String subject, String content) {
      try {
         conn=com.moim.db.MoimDB.getConn();
         
         int maxref=getMaxRef();
         
         String sql="insert into moim_noimg values(moim_noimg_idx.nextval,?,?,2,?,?,?,sysdate,?,0,0)";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, idx_member);
         ps.setInt(2, idx_info);
         ps.setString(3, "하니");
         ps.setString(4, subject);
         ps.setString(5, content);
         ps.setInt(6, maxref+1);
         
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

   
   /**QnA 글 순서 변경 관련 메서드*/
   public void setUpdateSunbun(int ref, int sunbun) {
      try {
         String sql="update moim_noimg set sunbun=sunbun+1 where ref=? and sunbun>=? and category=2";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, ref);
         ps.setInt(2, sunbun);
      } catch (Exception e) {
         e.printStackTrace();
      }finally {
         try {
            if(ps!=null)ps.close();
         } catch (Exception e2) {}
      }
   }
   
   /**QnA 답변 작성 관련 메서드*/
   public int setReNoimg(NoimgDTO dto) {
      try {
         conn=com.moim.db.MoimDB.getConn();
         
         setUpdateSunbun(dto.getRef(),dto.getSunbun()+1);
         
         String sql="insert into moim_noimg values(moim_noimg_idx.nextval,?,?,2,?,?,?,sysdate,?,?,?)";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, dto.getIdx_member());
         ps.setInt(2, dto.getIdx_info());
         ps.setString(3, dto.getWriter());
         ps.setString(4, dto.getSubject());
         ps.setString(5, dto.getContent());
         ps.setInt(6, dto.getRef());
         ps.setInt(7, dto.getLev()+1);
         ps.setInt(8, dto.getSunbun()+1);
         
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
   
   /**총 게시글 수 관련 메서드*/
   public int getTotalCnt(int idx_info) {
      try {
         conn=com.moim.db.MoimDB.getConn();
         String sql="select count(*) from moim_noimg where category=2 and idx_info=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, idx_info);
         rs=ps.executeQuery();
         rs.next();
         int count=rs.getInt(1);
         return count==0?1:count;
      } catch (Exception e) {
         e.printStackTrace();
         return 1;
      }finally {
         try {
            if(rs!=null)rs.close();
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         } catch (Exception e2) {}
      }
   }
   
   /**QnA 글 목록 관련 메서드*/
   public ArrayList<NoimgDTO> getQnaList(int idx_info, int ls, int cp){
      try {
         conn=com.moim.db.MoimDB.getConn();
         
         int start=(cp-1)*ls+1;
         int end=cp*ls;
         
         String sql="select * from "
               + "(select rownum as rnum, a.* from "
               + "(select * from moim_noimg where idx_info=? order by ref desc,sunbun asc) a)b "
               + "where rnum>=? and rnum<=?";
         
         ps=conn.prepareStatement(sql);
         ps.setInt(1, idx_info); //ps.setInt(1, idx_info);
         ps.setInt(2, start);
         ps.setInt(3, end);
         rs=ps.executeQuery();
         
         ArrayList<NoimgDTO> arr=new ArrayList<NoimgDTO>();
         while(rs.next()) {
            int idx=rs.getInt("idx");
            int idx_member=rs.getInt("idx_member");
            int category=rs.getInt("category");
            String writer=rs.getString("writer");
            String subject=rs.getString("subject");
            String content=rs.getString("content");
            java.sql.Date writedate=rs.getDate("writedate");
            int ref=rs.getInt("ref");
            int lev=rs.getInt("lev");
            int sunbun=rs.getInt("sunbun");
            
            NoimgDTO dto=new NoimgDTO(idx, idx_member, idx_info, category,writer, subject, content, writedate, ref, lev, sunbun);
            arr.add(dto);
         }

         return arr;
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
   
   /**QnA 글 수정하기 관련 메서드*/
   public int updateQna(NoimgDTO dto) {
	   try {
	          conn=com.moim.db.MoimDB.getConn();
	          String sql="update moim_noimg set subject=?, content=? where idx=?";
	          ps=conn.prepareStatement(sql);
	          ps.setString(1, dto.getSubject());
	          ps.setString(2, dto.getContent());
	          ps.setInt(3, dto.getIdx());
	          int count=ps.executeUpdate();
	          return count;
	       }catch(Exception e) {
	          e.printStackTrace();
	          return -1;
	       }finally {
	          try {
	             if(ps!=null)ps.close();
	             if(conn!=null)conn.close();
	          }catch(Exception e2) {
	             
	          }
	       }
   }
   
   /**QnA 글 삭제 관련 메서드*/
   public int delQna(int idx) {
      try {
         conn=com.moim.db.MoimDB.getConn();
         String sql="delete from moim_noimg where idx=?";
         ps=conn.prepareStatement(sql);
         ps.setInt(1, idx);
         int count=ps.executeUpdate();
         return count;
      }catch(Exception e) {
         e.printStackTrace();
         return -1;
      }finally{
         try {
            if(ps!=null)ps.close();
            if(conn!=null)conn.close();
         }catch(Exception e2) {
            
         }
      }
   }
   
   
}