package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constants.WPConstants;
import dao.ConcertDao;
import dao.ReservationDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.ReservationDataBean;
import dto.UserDataBean;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserManageController")
public class UserManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * #
	 * 
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
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_USER_SIGNUP);
				view.forward(request, response);
			} else if (action.equals("mypage")) {
				pushInformationPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_USER_MYPAGE);
				view.forward(request, response);
			} else if (action.equals("focusConcert")) { // 관심영화
				pushFocusConcertPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_USER_MYPAGE);
				view.forward(request, response);
			} else if (action.equals("myReservationHistoryPage")) { // 예매내역 미구현
				pushReservationHistoryPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_USER_MYPAGE);
				view.forward(request, response);
			} else if (action.equals("login")) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_USER_LOGIN);
				view.forward(request, response);
			} else if (action.equals("modify")) {
				pushModifyPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_USER_MODIFY);
				view.forward(request, response);
			} else if (action.equals("logout")) {
				request.getSession().invalidate();
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			}
		}
	}

	private void pushModifyPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		UserDataBean user;
		try {
			user = UserDao.getInstance().getMember(
					(String) request.getSession().getAttribute("userid"));
			request.setAttribute("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean confirm = false;
		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);

		if (request.getParameter("action").equals("login")) {
			confirm = pushLogin(request, response);
			forwarding(request, response, confirm);
		} else if (request.getParameter("action").equals("modify")) {
			confirm = pushModify(request, response);
			forwarding(request, response, confirm);
		} else if (request.getParameter("action").equals("register")) {
			confirm = pushInsertMember(request, response);
			forwarding(request, response, confirm);
		}
	}

	private void pushReservationHistoryPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			UserDataBean user = UserDao.getInstance().getMember(
					(String) request.getSession().getAttribute("userid"));
			ArrayList<ReservationDataBean> reservations = ReservationDao
					.getInstance().getReservations(user.getUserid());
			request.setAttribute("user", user);
			request.setAttribute("reservations", reservations);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
			user.setLevel(1);
			user.setBuyMoney(0);

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
						.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			} else {
				response.sendRedirect(WPConstants.PAGE_URL_USER_LOGIN);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}