package com.moim.review;

import java.sql.*;
import java.util.*;
import java.util.Date;

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
			String sql = "select max(ref) from moim_review";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int max = 0;
			if (rs.next()) {
				max = rs.getInt(1);
			}
			return max;

		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 글쓰기 관련 메서드 */

	public int setReview(ReviewDTO dto) {
		try {
			conn = com.moim.db.MoimDB.getConn();

			int maxref = getMaxRef();
			String sql = "insert into moim_review values(moim_review_idx.nextval,?,?,?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getIdx_member());
			ps.setString(2, dto.getMoimname());
			ps.setString(3, dto.getLocal());
			ps.setString(4, dto.getHobby());
			ps.setString(5, dto.getWriter());
			ps.setString(6, dto.getSubject());
			ps.setString(7, dto.getContent());
			ps.setString(8, dto.getImg());

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

	/** 총 게시물 수 관련 메서드 */

	public int getTotalCnt() {
		try {
			conn = com.moim.db.MoimDB.getConn();
			String sql = "select count(*) from moim_review";
			ps = conn.prepareStatement(sql);
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

	/** 순서 변경 관련 메서드 */
	public void setUpdateSun(int ref, int sunbun) {
		try {
			// 답변을 받고 하는것이니 conn 은 따로 받지 않는다
			String sql = "update moim_review set sunbun = sunbun+1 where ref=? and sunbun>=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sunbun);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 목록 출력 관련 메서드 */
	// 애초에 전부 다 가져와도 된다
	public ArrayList<ReviewDTO> getList(int ls, int cp) {
//		ls = listSize
		try {
			conn = com.moim.db.MoimDB.getConn();
			/* String sql = "select * from jsp_bbs order by idx desc"; */

			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			// 쿼리에 계산식은 들어가면 안된다
			String sql =

					"select * from " + "(select rownum as rnum,a.* from " + "(select * from moim_review)a)b "
							+ "where rnum>=? and rnum<=?";

			ps = conn.prepareStatement(sql);

			ps.setInt(1, start);
			ps.setInt(2, end);
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
	public int updateReview(ReviewDTO dto) {
		try {
//			dbConnect();
			conn = com.moim.db.MoimDB.getConn();
			String sql = "update moim_review set content=? where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getContent());
			ps.setInt(2, dto.getIdx());
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
	/**삭제 관련 메서드*/
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
}
