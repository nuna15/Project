package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import connection.ConnectionManager;
import dto.ConcertDataBean;

public class ConcertDao {

	private static ConcertDao instance = new ConcertDao();

	public static ConcertDao getInstance() {
		return instance;
	}

	private ConcertDao() {
	}

	private Connection getConnection() throws Exception {
		return ConnectionManager.getInstance().getConnection();
	}

	public void insertConcert(ConcertDataBean concert) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("insert into concert values (null,?,?,?,?,?,?,?,?)");
			pstmt.setInt(1, concert.getTimeNumber());
			pstmt.setDate(2, concert.getConcertDate());
			pstmt.setInt(3, concert.getAllowNumber());
			pstmt.setTime(4, concert.getStartDate());
			pstmt.setTime(5, concert.getFinishDate());
			pstmt.setString(6, concert.getConcertName());
			pstmt.setString(7, concert.getContent());
			pstmt.setString(8, concert.getActor());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public ConcertDataBean getConcert(int concertId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertDataBean concert = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from concert where concertid = ?");
			pstmt.setInt(1, concertId);
			rs = pstmt.executeQuery();

			rs = pstmt.executeQuery();
			if (rs.next()) {
				concert = new ConcertDataBean();
				concert.setConcertId(rs.getInt("concertid"));
				concert.setTimeNumber(rs.getInt("timenumber"));
				concert.setConcertDate(rs.getDate("concertdate"));
				concert.setAllowNumber(rs.getInt("allownumber"));
				concert.setStartDate(rs.getTime("starttime"));
				concert.setFinishDate(rs.getTime("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return concert;
	}

	public ConcertDataBean getConcertId(String concertName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertDataBean concert = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from concert where concertname = ?");
			pstmt.setString(1, concertName);
			rs = pstmt.executeQuery();

			rs = pstmt.executeQuery();
			if (rs.next()) {
				concert = new ConcertDataBean();
				concert.setConcertId(rs.getInt("concertid"));
				concert.setTimeNumber(rs.getInt("timenumber"));
				concert.setConcertDate(rs.getDate("concertdate"));
				concert.setAllowNumber(rs.getInt("allownumber"));
				concert.setStartDate(rs.getTime("starttime"));
				concert.setFinishDate(rs.getTime("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return concert;
	}

	public void updateConcert(ConcertDataBean concert) {

	}
}
