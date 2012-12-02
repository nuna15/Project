package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import constants.Constants;

import dao.UserDao;
import dto.UserDataBean;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserManageController")
public class UserManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserManageController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		if (action != null) {
			if (action.equals("register")) {
				pushRegisterPage(request, response);
			} else if (action.equals("mypage")) {
				pushInformationPage(request, response);
			} else if (action.equals("focusConcert")) {
				pushFocusConcertPage(request, response);
			} else if (action.equals("myReservationHistoryPage")) {
				pushReservationHistoryPage(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String requestUrl = request.getHeader("REFERER");
		boolean confirm = false;
		request.setCharacterEncoding(Constants.MAIN_ENCODING);

		if (requestUrl.equals(Constants.PAGE_SERVER_URL
				+ Constants.PAGE_URL_USER_LOGIN)) {
			confirm = pushLogin(request, response);
			forwarding(request, response, confirm);
		} else if (requestUrl.equals(Constants.PAGE_SERVER_URL
				+ Constants.PAGE_URL_USER_MODIFY)) {
			confirm = pushModify(request, response);
			forwarding(request, response, confirm);
		} else if (requestUrl.equals(Constants.PAGE_SERVER_URL
				+ Constants.PAGE_URL_USER_SIGNUP)) {
			confirm = pushInsertMember(request, response);
			forwarding(request, response, confirm);
		}
	}

	private void pushReservationHistoryPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void pushFocusConcertPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void pushInformationPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			UserDataBean user = UserDao.getInstance().getMember(
					(String) request.getSession().getAttribute("userid"));
			request.setAttribute("user", user);
			// request.setAttribute("userRank", user.getRank());
			// request.setAttribute("userName", user.getName()); 주문금액 구현 해야함
			// log테이블 이용
			// request.setAttribute("userName", user.getName()); 사용가능 적립금
			// request.setAttribute("userName", user.getName()); 사용된 적립금
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void pushRegisterPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private boolean pushLogin(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

		if (loginConfirm(request, response)) {
			try {
				UserDataBean user;
				user = UserDao.getInstance().getMember(
						(String) request.getParameter("userid"));
				HttpSession session = request.getSession();
				session.setAttribute("userid", user.getUserid());
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	private boolean pushInsertMember(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			UserDataBean user = new UserDataBean();
			user.setUserid(request.getParameter("userid"));
			user.setPassword(request.getParameter("password"));
			user.setName(request.getParameter("name"));
			// user.setName(new String(request.getParameter("name").getBytes(
			// "euc-kr"), "utf-8"));
			user.setSsn1(request.getParameter("ssn1"));
			user.setSsn2(request.getParameter("ssn2"));
			user.setFacebookid(request.getParameter("facebookid"));
			user.setSignDate(new Date(System.currentTimeMillis()));
			UserDao.getInstance().insertMember(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private boolean pushModify(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			UserDataBean user = UserDao.getInstance().getMember(
					(String) request.getSession().getAttribute("userid"));
			user.setPassword(request.getParameter("password"));
			user.setFacebookid(request.getParameter("facebookid"));
			UserDao.getInstance().updateMember(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	private boolean loginConfirm(HttpServletRequest request,
			HttpServletResponse response) {
		if (request.getParameter("userid") != null
				&& request.getParameter("password") != null) {
			return UserDao.getInstance().confirmId(
					request.getParameter("userid"),
					request.getParameter("password"));
		}
		return false;
	}

	private void forwarding(HttpServletRequest request,
			HttpServletResponse response, boolean confirm) {
		// TODO Auto-generated method stub
		try {
			if (confirm) {
				// response.sendRedirect(Constants.PAGE_URL_MAINPAGE);
				RequestDispatcher view = request
						.getRequestDispatcher(Constants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			} else {
				response.sendRedirect(Constants.PAGE_URL_USER_LOGIN);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}