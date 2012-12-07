package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
					.prepareStatement("insert into concert(timenumber,allownumber, starttime,endtime,concertname,content,actor,signdate,imgurl,standseat,normalseat,sseat) values (?, ?,?,?,?,?,?,?,?,?,?,?)");

			pstmt.setInt(1, concert.getTimeNumber());
			pstmt.setInt(2, concert.getAllowNumber());
			pstmt.setDate(3, concert.getStartDate());
			pstmt.setDate(4, concert.getEndDate());
			pstmt.setString(5, concert.getConcertName());
			pstmt.setString(6, concert.getContent());
			pstmt.setString(7, concert.getActor());
			pstmt.setDate(8, concert.getSignDate());
			pstmt.setString(9, concert.getImgUrl());
			pstmt.setInt(10, 0);
			pstmt.setInt(11, 0);
			pstmt.setInt(12, 0);

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
			if (rs.next()) {
				concert = new ConcertDataBean();
				concert.setConcertId(rs.getInt("concertid"));
				concert.setTimeNumber(rs.getInt("timenumber"));
				concert.setAllowNumber(rs.getInt("allownumber"));
				concert.setStartDate(rs.getDate("starttime"));
				concert.setEndDate(rs.getDate("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
				concert.setSignDate(rs.getDate("signdate"));
				concert.setImgUrl(rs.getString("imgurl"));
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
			if (rs.next()) {
				concert = new ConcertDataBean();
				concert.setConcertId(rs.getInt("concertid"));
				concert.setTimeNumber(rs.getInt("timenumber"));
				concert.setAllowNumber(rs.getInt("allownumber"));
				concert.setStartDate(rs.getDate("starttime"));
				concert.setEndDate(rs.getDate("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
				concert.setSignDate(rs.getDate("signdate"));
				concert.setImgUrl(rs.getString("imgurl"));
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

	public ArrayList<ConcertDataBean> getConcerts() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConcertDataBean concert = null;
		ArrayList<ConcertDataBean> concerts = new ArrayList<ConcertDataBean>();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from concert");

			rs = pstmt.executeQuery();
			while (rs.next()) {
				concert = new ConcertDataBean();
				concert.setConcertId(rs.getInt("concertid"));
				concert.setTimeNumber(rs.getInt("timenumber"));
				concert.setAllowNumber(rs.getInt("allownumber"));
				concert.setStartDate(rs.getDate("starttime"));
				concert.setEndDate(rs.getDate("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
				concert.setSignDate(rs.getDate("signdate"));
				concert.setImgUrl(rs.getString("imgurl"));
				concerts.add(concert);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return concerts;
	}

}
