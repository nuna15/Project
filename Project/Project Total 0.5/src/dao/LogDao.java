package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionManager;
import dto.LogDataBean;

public class LogDao {
	private static LogDao instance = new LogDao();

	public static LogDao getInstance() {
		return instance;
	}

	private LogDao() {
	}

	private Connection getConnection() throws Exception {
		return ConnectionManager.getInstance().getConnection();
	}

	public void insertMember(LogDataBean log) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("insert into log values (null,?,?,?,?)");
			pstmt.setString(1, log.getLogName());
			pstmt.setDate(2, log.getLogRegisterTime());
			pstmt.setString(3, log.getCost());
			pstmt.setString(4, log.getUserid());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public LogDataBean getLog(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogDataBean log = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from log where logid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				log = new LogDataBean();
				log.setLogid(rs.getInt("logid"));
				log.setLogName(rs.getString("logName"));
				log.setLogRegisterTime(rs.getDate("logRegisterTime"));
				log.setCost(rs.getString("cost"));
				log.setUserid(rs.getString("userid"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return log;
	}

	public ArrayList<LogDataBean> getLogs() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		LogDataBean log = null;
		ArrayList<LogDataBean> logs = new ArrayList<LogDataBean>();
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from log");

			rs = pstmt.executeQuery();
			if (rs.next()) {
				log = new LogDataBean();
				log.setLogid(rs.getInt("logid"));
				log.setLogName(rs.getString("logName"));
				log.setLogRegisterTime(rs.getDate("logRegisterTime"));
				log.setCost(rs.getString("cost"));
				log.setUserid(rs.getString("userid"));

				logs.add(log);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return logs;
	}

}
