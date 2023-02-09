package com.moim.review;

import java.sql.*;
import java.util.*;
import java.util.Date;
import com.oreilly.servlet.MultipartRequest;

public class ReviewDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public ReviewDAO() {
		// TODO Auto-generated constructor stub
	}


	/** 총 게시물 수 관련 메서드 */

	public int getTotalCnt(String userhobby, String keyword, boolean boo) {
		try {
			conn = com.moim.db.MoimDB.getConn();
			String sql = "select count(*) from moim_review ";
			int count2 = 0;
			
			if(boo) {
				sql=sql+ " where ";
				
			}
			
			if (!userhobby.equals("전체")) {
				sql = sql + " hobby ='" +userhobby+ "' ";
				count2++;
			}
			if (!keyword.equals("")) {
				if(count2==1) {
					sql = sql+" and ";
					
				}
				keyword = "%" + keyword.replace(" ", "%") + "%";
				sql = sql + " moimname like ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, keyword);
				
			} else {
				ps = conn.prepareStatement(sql);
			}

			rs = ps.executeQuery();
			rs.next();
			
			
			
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}

	}

	/** 목록 출력 관련 메서드 */
	public ArrayList<ReviewDTO> getList(int ls, int cp, String userhobby, String keyword, boolean boo) {
		try {
			conn = com.moim.db.MoimDB.getConn();

			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			String sql =

					"select * from " + "(select rownum as rnum,a.* from "
							+ "(select * from moim_review  ";
			
			int count2 = 0;
			if(boo) {
				sql=sql+" where ";
			}
				
				
			if (!userhobby.equals("전체")) {
				sql = sql + " hobby ='" + userhobby + "' ";
				count2++;
			}
			if (!keyword.equals("")) {
				if(count2==1) {
					sql = sql+" and ";
					
				}
				keyword = "%" + keyword.replace(" ", "%") + "%";
				sql = sql + " moimname like ? order by idx desc)a)b where rnum>=? and rnum<=? ";
				ps = conn.prepareStatement(sql);
				ps.setString(1, keyword);
				ps.setInt(2, start);
				ps.setInt(3, end);
				
			} else {
				sql = sql + " order by idx desc)a)b where rnum>=? and rnum<=? ";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
			}
		

			rs = ps.executeQuery();
			ArrayList<ReviewDTO> arr = new ArrayList<ReviewDTO>();

			while (rs.next()) {
				int idx = rs.getInt("idx");
				int idx_member = rs.getInt("idx_member");
				String moimname = rs.getString("moimname");
				String writer = rs.getString("writer");
				String local = rs.getString("local");
				String hobby = rs.getString("hobby");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String img = rs.getString("img");
				Date writedate = rs.getDate("writedate");

				ReviewDTO dto = new ReviewDTO(idx, idx_member, moimname, writer, local, hobby, subject, content, img,
						writedate);
				arr.add(dto);
				

			}
			return arr;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 글 본문보기 출력 관련 메서드 */
	public ReviewDTO getContent(int idx) {
		try {
			conn = com.moim.db.MoimDB.getConn();
			String sql = "select * from moim_review where idx=? order by idx desc";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();

			ReviewDTO dto = null;
			if (rs.next()) {
				int idx_member = rs.getInt("idx_member");
				String moimname = rs.getString("moimname");
				String writer = rs.getString("writer");
				String local = rs.getString("local");
				String hobby = rs.getString("hobby");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String img = rs.getString("img");
				Date writedate = rs.getDate("writedate");
				dto = new ReviewDTO(idx, idx_member, moimname, writer, local, hobby, subject, content, img, writedate);

			}

			return dto;

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 수정용 조회 관련 메소드 */
	public ReviewDTO updateReviewForm(int idx) {
		try {
//			dbConnect();
			conn = com.moim.db.MoimDB.getConn();
			String sql = "select * from moim_review where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			
			ReviewDTO dto = null;
			if (rs.next()) {
				
				int idx_member = rs.getInt("idx_member");
				String moimname = rs.getString("moimname");
				String writer = rs.getString("writer");
				String local = rs.getString("local");
				String hobby = rs.getString("hobby");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				String img = rs.getString("img");
				Date writedate = rs.getDate("writedate");
				dto = new ReviewDTO(idx, idx_member, moimname, writer, local, hobby, subject, content, img, writedate);

			}

			return dto;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {

				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (ps != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 수정 관련 메소드 */
	public int updateReview(ReviewDTO dto, MultipartRequest mr ) {
		try {
//			dbConnect();
			conn = com.moim.db.MoimDB.getConn();
			String sql = "update moim_review set subject=?, content=? , img=? where idx=?";
			ps = conn.prepareStatement(sql);
			
			String img = mr.getFilesystemName("upload");
			
			ps.setString(1, dto.getSubject());
			ps.setString(2, dto.getContent());
			ps.setString(3, img);
			ps.setInt(4, dto.getIdx());
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

	/** 삭제 관련 메서드 */
	public int delReview(ReviewDTO dto) {
		try {

			conn = com.moim.db.MoimDB.getConn();
			String sql = "delete from moim_review where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIdx());

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

	/** 이미지 관련 등록 관련 메서드 */

	public int addImage(MultipartRequest mr, int idx_member) {
		try {
			conn = com.moim.db.MoimDB.getConn();
			String sql = "insert into moim_review values(moim_review_idx.nextval,?,?,?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);

			String idx_member_s = mr.getParameter("idx_member");
			if (idx_member_s == null || idx_member_s.equals("")) {
				idx_member_s = "0";
			}
		
			String moimname = mr.getParameter("moimname");
			String local = mr.getParameter("local");
			String hobby = mr.getParameter("hobby");
			String writer = mr.getParameter("writer");
			String subject = mr.getParameter("subject");
			String content = mr.getParameter("content");
			String img = mr.getFilesystemName("upload");
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx_member);
			ps.setString(2, moimname);
			ps.setString(3, local);
			ps.setString(4, hobby);
			ps.setString(5, writer);
			ps.setString(6, subject);
			ps.setString(7, content);
			ps.setString(8, img);
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

	/** 이미지 가져오기 메서드 */
	public String getAdrImg(int idx) {
		try {

			conn = com.moim.db.MoimDB.getConn();
			String sql = "select img from moim_review where idx =?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			rs=ps.executeQuery();
			
			rs.next();
			String str = rs.getString("img");
			
			return str ;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null)rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}
	
}
