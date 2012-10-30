package board;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class BoardDBBean {

	private static BoardDBBean instance = new BoardDBBean();

	// .jsp���������� DB�������� BoardDBBeanŬ������ �޼ҵ忡 ���ٽ� �ʿ�
	public static BoardDBBean getInstance() {
		return instance;
	}

	private BoardDBBean() {
	}

	// Ŀ�ؼ�Ǯ�κ��� Connection��ü�� �� : DB�������� �������� �����ϴ� �޼ҵ忡�� ���
	private Connection getConnection() throws Exception {
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource) envCtx.lookup("jdbc/Test");
		return ds.getConnection();
	}

	// board���̺� ���� �߰�(inset��)<=writePro.jsp���������� ��
	public void insertArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		// 32~35������ �亯���� ���� ����
		int num = article.getNum();// �θ��� �۹�ȣ
		int ref = article.getRef();// �θ��� ref(�׷�ȭ ���̵�)
		int re_step = article.getRe_step();// �θ��� re_step(�׷쳻 ����)
		int re_level = article.getRe_level();// �θ��� re_level(�鿩���� ����)
		int number = 0;// board���̺� �� �۹�ȣ
		String sql = "";

		try {
			conn = getConnection();
			// 42~48������ ���� board���̺� ���ڵ��� ������ �Ǵܰ� �۹�ȣ�� ����
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();

			if (rs.next())// ������ ���ڵ尡 ����
				number = rs.getInt(1) + 1;// ������ ��ȣ(���� �߰���)�� ����ū��ȣ+1
			else
				// ù��° ��
				number = 1;
			// 50~63������ ����۰� �亯�۰��� ������ ����
			if (num != 0) // �亯���� �θ���� �۹�ȣ�� ����=>�亯�� 50~59
			{
				sql = "update board set re_step=re_step+1 where ref= ? and re_step> ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {// �θ���� ��� �۹�ȣ ���� => ����� 59~63
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			// ������ �ۼ� :board���̺� ���ο� ���ڵ� �߰�
			sql = "insert into board(writer,email,subject,passwd,reg_date,";
			sql += "ref,re_step,re_level,content,ip) values(?,?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
	}

	// board���̺� ����� ��ü���� ���� ��(select��)<=list.jsp���� ���
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// ���� ���(�������� ��)�� ������(select��) <=list.jsp
	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;// �۸���� �����ϴ� ��ü
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select * from board order by ref desc, re_step asc limit ?,? ");
			pstmt.setInt(1, start - 1);// mysql���� ù��°���ڵ��� ���۹�ȣ�� 0���� ������, ����
										// ȭ��ǥ���� �۹�ȣ���� �ϳ� �۴�
			pstmt.setInt(2, end);// ������ ���ڵ��� ����
			rs = pstmt.executeQuery();// ResultSet�� ��ȯ

			if (rs.next()) {// ResultSet�� ���ڵ带 ����
				articleList = new ArrayList(end);// ��� ��ü�� �������� ũ�⸦ �����ؼ� ��ü�� ����
													// =>��ü�����
				do {// 134~150����: ResultSet�� �ִ� ���ڵ�� ��ŭ �ݺ�����
					BoardDataBean article = new BoardDataBean();// ���ڵ� �ϳ���
					article.setNum(rs.getInt("num"));// ResultSet���κ��� �ϳ���
					article.setWriter(rs.getString("writer"));// ���ڵ��� ������
					article.setEmail(rs.getString("email"));// �ʵ尪�� ����
					article.setSubject(rs.getString("subject"));// JSP����������
					article.setPasswd(rs.getString("passwd"));// ����ϱ����ؼ�
					article.setReg_date(rs.getTimestamp("reg_date"));// �ڹٺ�ü��
																		// ���� ����
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					// List��ü�� ������������� BoardDataBean��ü�� ����
					articleList.add(article);
				} while (rs.next());
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return articleList;// List��ü�� ���۷����� ����
	}

	// ���� ������ ����(1���� ��)(select��)<=content.jsp���������� ���
	public BoardDataBean getArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("update board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return article;
	}

	// �� ���������� ����� ���� ����(1���� ��)(select��)<=updateForm.jsp���� ���
	public BoardDataBean updateGetArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		try {
			conn = getConnection();

			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return article;
	}

	// �� ����ó������ ���(update��)<=updatePro.jsp���� ���
	public int updateArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String dbpasswd = "";
		String sql = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, article.getNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(article.getPasswd())) {
					sql = "update board set writer=?,email=?,subject=?,passwd=?";
					sql += ",content=? where num=?";
					pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, article.getWriter());
					pstmt.setString(2, article.getEmail());
					pstmt.setString(3, article.getSubject());
					pstmt.setString(4, article.getPasswd());
					pstmt.setString(5, article.getContent());
					pstmt.setInt(6, article.getNum());
					pstmt.executeUpdate();
					x = 1;
				} else {
					x = 0;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// �ۻ���ó���� ���(delete��)<=deletePro.jsp���������� ���
	public int deleteArticle(int num, String passwd) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpasswd = "";
		int x = -1;
		try {
			conn = getConnection();

			pstmt = conn
					.prepareStatement("select passwd from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dbpasswd = rs.getString("passwd");
				if (dbpasswd.equals(passwd)) {
					pstmt = conn
							.prepareStatement("delete from board where num=?");
					pstmt.setInt(1, num);
					pstmt.executeUpdate();
					x = 1; // �ۻ��� ����
				} else
					x = 0; // ��й�ȣ Ʋ��
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}
}