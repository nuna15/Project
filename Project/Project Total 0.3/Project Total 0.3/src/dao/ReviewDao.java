package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ConnectionManager;
import dto.ReviewDataBean;

public class ReviewDao {

	private static ReviewDao instance = new ReviewDao();

	public static ReviewDao getInstance() {
		return instance;
	}

	private ReviewDao() {
	}

	private Connection getConnection() throws Exception {
		return ConnectionManager.getInstance().getConnection();
	}

	public void insertReview(ReviewDataBean review) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("insert into user values (?,?,?,?,?,?)");
			pstmt.setInt(1, review.getReviewid());
			pstmt.setString(2, review.getUserid());
			pstmt.setInt(3, review.getConcertid());
			pstmt.setInt(4, review.getScore());
			pstmt.setInt(5, review.getEvaluateNumber());
			pstmt.setString(6, review.getContents());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public ReviewDataBean getReview(int reviewId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewDataBean review = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from user where reviewid = ?");
			pstmt.setInt(1, reviewId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				review = new ReviewDataBean();
				review.setReviewid(rs.getInt("password"));
				review.setUserid(rs.getString("userid"));
				review.setConcertid(rs.getInt("concertid"));
				review.setScore(rs.getInt(rs.getInt("score")));
				review.setEvaluateNumber(rs.getInt("evaluateNumber"));
				review.setContents(rs.getString("contents"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return review;
	}

	public int getReviewRate(int reviewId) {
		// 리뷰의 등수 or 평점을 리턴
		return 0;
	}

	public void updateReview(int reviewId) {
		// 리뷰 수정
	}

	public void deleteReview(int reviewId) {
		// 리뷰 삭제
	}
}