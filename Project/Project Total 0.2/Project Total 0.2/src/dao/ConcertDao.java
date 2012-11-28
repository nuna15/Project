package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
					.prepareStatement("insert into user values (?,?,?,?,?,?,?)");
			pstmt.setInt(1, concert.getConcertId());
			pstmt.setInt(2, concert.getTimeNumber());
			pstmt.setDate(3, concert.getConcertDate());
			pstmt.setInt(4, concert.getAllowNumber());
			pstmt.setTime(5, concert.getStartTime());
			pstmt.setTime(6, concert.getEndTime());
			pstmt.setString(7, concert.getConcertName());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public void deleteConcert(ConcertDataBean concert) throws Exception {
		// Connection conn = null;
		// PreparedStatement pstmt = null;
		//
		// try {
		// conn = getConnection();
		// } catch (Exception ex) {
		//
		// } finally {
		// if (conn != null) {
		// try {
		// conn.close();
		// } catch (SQLException ex) {
		// }
		// }
		// }
	}

	public int getConcert(int concertId) {
		return 0;
	}
}
