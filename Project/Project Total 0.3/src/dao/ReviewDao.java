package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
					.prepareStatement("insert into review values (null,?,?,?,?,?,?)");
			pstmt.setString(1, review.getUserid());
			pstmt.setInt(2, review.getConcertid());
			pstmt.setInt(3, review.getScore());
			pstmt.setInt(4, review.getEvaluateNumber());
			pstmt.setString(5, review.getContents());
			pstmt.setString(6, review.getReviewName());

			System.out.println(review.getUserid());
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
					.prepareStatement("select * from review where reviewid = ?");
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
				review.setReviewName(rs.getString("reviewname"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return review;
	}

	public int getReviewRate(int reviewId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewDataBean review = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from review where reviewid = ?");
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
				review.setReviewName(rs.getString("reviewname"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return 0;
	}

	public void updateReview(int reviewId) {
		// 리뷰 수정
	}

	public void deleteReview(int reviewId) {
		// 리뷰 삭제
	}

	public ArrayList<ReviewDataBean> getReviews() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReviewDataBean review = null;
		ArrayList<ReviewDataBean> reviews = new ArrayList<ReviewDataBean>();
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from review");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				review = new ReviewDataBean();
				review.setReviewid(rs.getInt("password"));
				review.setUserid(rs.getString("userid"));
				review.setConcertid(rs.getInt("concertid"));
				review.setScore(rs.getInt(rs.getInt("score")));
				review.setEvaluateNumber(rs.getInt("evaluateNumber"));
				review.setContents(rs.getString("contents"));
				review.setReviewName(rs.getString("reviewname"));

				reviews.add(review);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return reviews;
	}
}