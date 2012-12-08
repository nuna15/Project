package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionManager;
import dto.ConcertDataBean;
import dto.ConcertInstanceDataBean;

public class ConcertInstanceDao {
	private static ConcertInstanceDao instance = new ConcertInstanceDao();

	public static ConcertInstanceDao getInstance() {
		return instance;
	}

	private ConcertInstanceDao() {
	}

	private Connection getConnection() throws Exception {
		return ConnectionManager.getInstance().getConnection();
	}

	public void insertConcertInstance(ConcertInstanceDataBean instance)
			throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("insert into con_instance(timenumber,seatcount, concertdate, concertid, aseat, bseat, cseat, dseat, eseat) values (?,?,?,?,?,?,?,?,?)");

			pstmt.setInt(1, instance.getTimeNumber());
			pstmt.setInt(2, instance.getSeatCount());
			pstmt.setDate(3, instance.getConcertDate());
			pstmt.setInt(4, instance.getConcertid());
			pstmt.setInt(5, instance.getaSeat());
			pstmt.setInt(6, instance.getbSeat());
			pstmt.setInt(7, instance.getcSeat());
			pstmt.setInt(8, instance.getdSeat());
			pstmt.setInt(9, instance.geteSeat());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public ConcertInstanceDataBean getConcertInstance(int instanceId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertInstanceDataBean concert = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from con_instance where instanceid = ?");
			pstmt.setInt(1, instanceId);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				concert = new ConcertInstanceDataBean();
				concert.setInstanceid(rs.getInt("instanceid"));
				concert.setTimeNumber(rs.getInt("timenumber"));
				concert.setSeatCount(rs.getInt("seatcount"));
				concert.setConcertDate(rs.getDate("date"));
				concert.setConcertid(rs.getInt("concertid"));
				concert.setaSeat(rs.getInt("aseat"));
				concert.setbSeat(rs.getInt("bseat"));
				concert.setcSeat(rs.getInt("cseat"));
				concert.setdSeat(rs.getInt("dseat"));
				concert.seteSeat(rs.getInt("eseat"));

			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return concert;
	}

	public ConcertInstanceDataBean getConcertInstance(Date concertDate,
			int concertid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertInstanceDataBean concert = null;
		ArrayList<ConcertInstanceDataBean> concerts = new ArrayList<ConcertInstanceDataBean>();

		System.out.println("at Instance " + concertDate);
		System.out.println("at Instance " + concertid);

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from con_instance where concertdate = ?");
			pstmt.setDate(1, concertDate);

			rs = pstmt.executeQuery();
			while (rs.next()) {
				concert = new ConcertInstanceDataBean();
				concert.setInstanceid(rs.getInt("instanceid"));
				concert.setTimeNumber(rs.getInt("timenumber"));
				concert.setSeatCount(rs.getInt("seatcount"));
				concert.setConcertDate(rs.getDate("concertdate"));
				concert.setConcertid(rs.getInt("concertid"));
				concert.setaSeat(rs.getInt("aseat"));
				concert.setbSeat(rs.getInt("bseat"));
				concert.setcSeat(rs.getInt("cseat"));
				concert.setdSeat(rs.getInt("dseat"));
				concert.seteSeat(rs.getInt("eseat"));

				concerts.add(concert);
			}

			for (int i = 0; concerts.size() > i; i++) {
				System.out.println("콘서트아이디" + concerts.get(i).getConcertid());
				if (concerts.get(i).getConcertid() == concertid) {
					System.out.println("return");
					return concerts.get(i);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return null;
	}

	public ArrayList<ConcertInstanceDataBean> getConcertInstances() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertInstanceDataBean instance = null;
		ArrayList<ConcertInstanceDataBean> instances = new ArrayList<ConcertInstanceDataBean>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from con_instance");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				instance = new ConcertInstanceDataBean();
				instance.setInstanceid(rs.getInt("instanceid"));
				instance.setTimeNumber(rs.getInt("timenumber"));
				instance.setSeatCount(rs.getInt("seatcount"));
				instance.setConcertDate(rs.getDate("concertdate"));
				instance.setConcertid(rs.getInt("concertid"));
				instance.setaSeat(rs.getInt("aseat"));
				instance.setbSeat(rs.getInt("bseat"));
				instance.setcSeat(rs.getInt("cseat"));
				instance.setdSeat(rs.getInt("dseat"));
				instance.seteSeat(rs.getInt("eseat"));

				instances.add(instance);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return instances;
	}

	public ArrayList<ConcertInstanceDataBean> getConcertInstances(int concertid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertInstanceDataBean instance = null;
		ArrayList<ConcertInstanceDataBean> instances = new ArrayList<ConcertInstanceDataBean>();
		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select * from con_instance where concertid = ?");
			pstmt.setInt(1, concertid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				instance = new ConcertInstanceDataBean();
				instance.setInstanceid(rs.getInt("instanceid"));
				instance.setTimeNumber(rs.getInt("timenumber"));
				instance.setSeatCount(rs.getInt("seatcount"));
				instance.setConcertDate(rs.getDate("concertdate"));
				instance.setConcertid(rs.getInt("concertid"));
				instance.setaSeat(rs.getInt("aseat"));
				instance.setbSeat(rs.getInt("bseat"));
				instance.setcSeat(rs.getInt("cseat"));
				instance.setdSeat(rs.getInt("dseat"));
				instance.seteSeat(rs.getInt("eseat"));

				instances.add(instance);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return instances;
	}

	public ArrayList<ConcertInstanceDataBean> getUserConcertInstances(
			String userid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertInstanceDataBean instance = null;
		ArrayList<ConcertInstanceDataBean> instances = new ArrayList<ConcertInstanceDataBean>();
		try {
			conn = getConnection();
			pstmt = conn
					.prepareStatement("select * from con_instance where userid = ?");
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				instance = new ConcertInstanceDataBean();
				instance.setInstanceid(rs.getInt("instanceid"));
				instance.setTimeNumber(rs.getInt("timenumber"));
				instance.setSeatCount(rs.getInt("seatcount"));
				instance.setConcertDate(rs.getDate("concertdate"));
				instance.setConcertid(rs.getInt("concertid"));
				instance.setaSeat(rs.getInt("aseat"));
				instance.setbSeat(rs.getInt("bseat"));
				instance.setcSeat(rs.getInt("cseat"));
				instance.setdSeat(rs.getInt("dseat"));
				instance.seteSeat(rs.getInt("eseat"));

				instances.add(instance);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return instances;
	}

	public void updateInstance(ConcertInstanceDataBean tempConcert) {
		// TODO Auto-generated method stub
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("update con_instance set aseat=?,bseat=?, cseat=?, dseat=?, eseat=? where instanceid=?");
			pstmt.setInt(1, tempConcert.getaSeat());
			pstmt.setInt(2, tempConcert.getbSeat());
			pstmt.setInt(3, tempConcert.getcSeat());
			pstmt.setInt(4, tempConcert.getdSeat());
			pstmt.setInt(5, tempConcert.geteSeat());
			pstmt.setInt(6, tempConcert.getInstanceid());

			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

}
