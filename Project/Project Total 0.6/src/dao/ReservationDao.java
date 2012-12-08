package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
					.prepareStatement("insert into reservation values (null,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, reservation.getUserid());
			pstmt.setInt(2, reservation.getConcertid());
			pstmt.setInt(3, reservation.getTimeNumber());
			pstmt.setInt(4, reservation.getReservationStatus());
			pstmt.setString(5, reservation.getSheetNumber());
			pstmt.setDate(6, reservation.getSignDate());
			pstmt.setInt(7, reservation.getInstanceid());
			pstmt.setDate(8, reservation.getConcertDate());
			pstmt.setString(9, reservation.getSeatType());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public void deleteReservation(int reservationId) {
		// 예매 취소
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("update reservation set reservationstat=? where reservationid=?");
			pstmt.setInt(1, 0);
			pstmt.setInt(2, reservationId);

			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public ReservationDataBean getReservationInformation(int reservationId) {
		// 예매 정보
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReservationDataBean reservation = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from concert where reservationid = ?");
			pstmt.setInt(1, reservationId);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				reservation = new ReservationDataBean();

				reservation.setReservationid(rs.getInt("reservationid"));
				reservation.setUserid(rs.getString("userid"));
				reservation.setConcertid(rs.getInt("concertid"));
				reservation.setTimeNumber(rs.getInt("timenumber"));
				reservation.setReservationStatus(rs.getInt("reservationstat"));
				reservation.setSheetNumber(rs.getString("sheetnumber"));
				reservation.setSignDate(rs.getDate("signdate"));
				reservation.setInstanceid(rs.getInt("instanceid"));
				reservation.setConcertDate(rs.getDate("concertdate"));
				reservation.setSeatType(rs.getString("seattype"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return reservation;
	}

	public ArrayList<ReservationDataBean> getReservations() {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReservationDataBean reservation = null;
		ArrayList<ReservationDataBean> reservations = new ArrayList<ReservationDataBean>();

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from reservation");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				reservation = new ReservationDataBean();

				reservation.setReservationid(rs.getInt("reservationid"));
				reservation.setUserid(rs.getString("userid"));
				reservation.setConcertid(rs.getInt("concertid"));
				reservation.setTimeNumber(rs.getInt("timenumber"));
				reservation.setReservationStatus(rs.getInt("reservationstat"));
				reservation.setSheetNumber(rs.getString("sheetnumber"));
				reservation.setSignDate(rs.getDate("signdate"));
				reservation.setInstanceid(rs.getInt("instanceid"));
				reservation.setConcertDate(rs.getDate("concertdate"));
				reservation.setSeatType(rs.getString("seattype"));

				reservations.add(reservation);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return reservations;
	}

	public ArrayList<ReservationDataBean> getReservations(String userid) {
		// TODO Auto-generated method stub
		ArrayList<ReservationDataBean> reservations = this.getReservations();
		ArrayList<ReservationDataBean> userReservation = new ArrayList<ReservationDataBean>();

		for (int i = 0; i < reservations.size(); i++) {
			if (reservations.get(i).getUserid().equals(userid)) {
				userReservation.add(reservations.get(i));
			}
		}
		return userReservation;
	}
}