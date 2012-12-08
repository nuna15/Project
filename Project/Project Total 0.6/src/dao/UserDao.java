package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import connection.ConnectionManager;
import dto.UserDataBean;

public class UserDao {

	private static UserDao instance = new UserDao();

	public static UserDao getInstance() {
		return instance;
	}

	private UserDao() {
	}

	private Connection getConnection() throws Exception {
		return ConnectionManager.getInstance().getConnection();
	}

	public void insertMember(UserDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("insert into user values (?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getSsn1());
			pstmt.setString(5, member.getSsn2());
			pstmt.setDate(6, member.getSignDate());
			pstmt.setString(7, member.getFacebookid());
			pstmt.setInt(8, member.getLevel());
			pstmt.setInt(9, member.getBuyMoney());
			pstmt.setInt(10, member.getPoint());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public UserDataBean getMember(String id) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDataBean member = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from user where userid = ?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				member = new UserDataBean();
				member.setUserid(rs.getString("userid"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setSignDate(rs.getDate("signdate"));
				member.setFacebookid(rs.getString("facebookid"));
				member.setLevel(rs.getInt("level"));
				member.setBuyMoney(rs.getInt("buymoney"));
				member.setPoint(rs.getInt("point"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return member;
	}

	public void updateMember(UserDataBean member) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("update user set password=?,facebookid=?, level=?, buymoney=?, point=? where userid=?");
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getFacebookid());
			pstmt.setInt(3, member.getLevel());
			pstmt.setInt(4, member.getBuyMoney());
			pstmt.setInt(5, member.getPoint());
			pstmt.setString(6, member.getUserid());

			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(pstmt, conn);
		}
	}

	public boolean confirmId(String id, String password) {
		try {
			UserDataBean member = this.getMember(id);
			if (member != null) {
				return member.getPassword().equals(password);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<UserDataBean> getMembers() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDataBean member = null;
		ArrayList<UserDataBean> users = new ArrayList<UserDataBean>();
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from user");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				member = new UserDataBean();

				member.setUserid(rs.getString("userid"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setSsn1(rs.getString("ssn1"));
				member.setSsn2(rs.getString("ssn2"));
				member.setSignDate(rs.getDate("signdate"));
				member.setFacebookid(rs.getString("facebookid"));
				member.setLevel(rs.getInt("level"));
				member.setBuyMoney(rs.getInt("buymoney"));
				member.setPoint(rs.getInt("point"));
				users.add(member);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			ConnectionManager.getInstance().close(rs, pstmt, conn);
		}
		return users;
	}

	public void deleteMember(UserDataBean user) {

	}

	public boolean checkId(String id) {
		try {
			UserDataBean user = this.getMember(id);
			if (user != null)
				return false;
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}
}