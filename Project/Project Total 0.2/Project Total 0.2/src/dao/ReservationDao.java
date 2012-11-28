package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.ConnectionManager;
import dto.ReservationDataBean;

public class ReservationDao {

	private static ReservationDao instance = new ReservationDao();

	public static ReservationDao getInstance() {
		return instance;
	}

	private ReservationDao() {
	}

	private Connection getConnection() throws Exception {
		return ConnectionManager.getInstance().getConnection();
	}

	public void insertReservation(ReservationDataBean reservation) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("insert into user values (?,?,?,?,?,?,?)");
			pstmt.setInt(1, reservation.getReservationid());
			pstmt.setString(2, reservation.getUserid());
			pstmt.setInt(3, reservation.getConcertid());
			pstmt.setInt(4, reservation.getTimeNumber());
			pstmt.setDate(5, reservation.getReservationTime());
			pstmt.setInt(6, reservation.getReservationStatus());
			pstmt.setString(7, reservation.getSheetNumber());
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public void deleteReservation(int reservationId) {
		// 예매 취소
	}

	public ReservationDataBean getReservationInformation(int reservationId) {
		// 예매 정보
		return null;
	}
}