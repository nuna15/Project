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
					.prepareStatement("insert into concert(timenumber, starttime,endtime,concertname,content,actor,signdate,imgurl, score, clickcount) values (?, ?,?,?,?,?,?,?,?,?)");

			pstmt.setInt(1, concert.getTimeNumber());
			pstmt.setDate(2, concert.getStartDate());
			pstmt.setDate(3, concert.getEndDate());
			pstmt.setString(4, concert.getConcertName());
			pstmt.setString(5, concert.getContent());
			pstmt.setString(6, concert.getActor());
			pstmt.setDate(7, concert.getSignDate());
			pstmt.setString(8, concert.getImgUrl());
			pstmt.setInt(9, concert.getScore());
			pstmt.setInt(10, concert.getClickCount());

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
				concert.setStartDate(rs.getDate("starttime"));
				concert.setEndDate(rs.getDate("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
				concert.setSignDate(rs.getDate("signdate"));
				concert.setImgUrl(rs.getString("imgurl"));
				concert.setScore(rs.getInt("score"));
				concert.setClickCount(rs.getInt("clickcount"));
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
				concert.setStartDate(rs.getDate("starttime"));
				concert.setEndDate(rs.getDate("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
				concert.setSignDate(rs.getDate("signdate"));
				concert.setImgUrl(rs.getString("imgurl"));
				concert.setScore(rs.getInt("score"));
				concert.setClickCount(rs.getInt("clickcount"));
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
				concert.setStartDate(rs.getDate("starttime"));
				concert.setEndDate(rs.getDate("endtime"));
				concert.setConcertName(rs.getString("concertname"));
				concert.setContent(rs.getString("content"));
				concert.setActor(rs.getString("actor"));
				concert.setSignDate(rs.getDate("signdate"));
				concert.setImgUrl(rs.getString("imgurl"));
				concert.setScore(rs.getInt("score"));
				concert.setClickCount(rs.getInt("clickcount"));
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
