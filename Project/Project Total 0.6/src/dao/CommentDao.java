package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionManager;
import dto.CommentDataBean;

public class CommentDao {

	private static CommentDao instance = new CommentDao();

	public static CommentDao getInstance() {
		return instance;
	}

	private CommentDao() {
	}

	private Connection getConnection() throws Exception {
		return ConnectionManager.getInstance().getConnection();
	}

	public void insertMember(CommentDataBean comment) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("insert into comment values (null,?,?,?)");
			pstmt.setString(1, comment.getComment());
			pstmt.setInt(2, comment.getReviewid());
			pstmt.setDate(3, comment.getSignDate());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public CommentDataBean getcomment(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentDataBean comment = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from comment where commentid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				comment = new CommentDataBean();
				comment.setCommentid(rs.getInt("commentid"));
				comment.setComment(rs.getString("comment"));
				comment.setReviewid(rs.getInt("reviewid"));
				comment.setSignDate(rs.getDate("signdate"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return comment;
	}

	public ArrayList<CommentDataBean> getComments() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentDataBean comment = null;
		ArrayList<CommentDataBean> comments = new ArrayList<CommentDataBean>();
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from comment");

			rs = pstmt.executeQuery();
			if (rs.next()) {
				comment = new CommentDataBean();
				comment.setCommentid(rs.getInt("commentid"));
				comment.setComment(rs.getString("comment"));
				comment.setReviewid(rs.getInt("reviewid"));
				comment.setSignDate(rs.getDate("signdate"));

				comments.add(comment);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return comments;
	}

	public ArrayList<CommentDataBean> getReviewComment(int reviewid)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CommentDataBean comment = null;
		ArrayList<CommentDataBean> comments = new ArrayList<CommentDataBean>();
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from comment where reviewid=?");
			pstmt.setInt(1, reviewid);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				comment = new CommentDataBean();
				comment.setCommentid(rs.getInt("commentid"));
				comment.setComment(rs.getString("comment"));
				comment.setReviewid(rs.getInt("reviewid"));
				comment.setSignDate(rs.getDate("signdate"));

				comments.add(comment);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return comments;
	}
}
