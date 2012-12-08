package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CosNaming.IstringHelper;

import utils.DateParser;
import utils.LogUpdater;
import constants.WPConstants;
import dao.ConcertDao;
import dao.ConcertInstanceDao;
import dao.ReservationDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.ConcertInstanceDataBean;
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
		} else if (request.getParameter("action").equals("cancel")) {
			confirm = pushCancleReservation(request, response);
			forwarding(request, response, confirm);
		}
	}

	private boolean pushCancleReservation(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			int reserveid = Integer.parseInt(request
					.getParameter("reservationid"));
			ReservationDataBean reservation = ReservationDao.getInstance()
					.getReservationInformation(reserveid);
			UserDataBean user = UserDao.getInstance().getMember(
					reservation.getUserid());

			ArrayList<ConcertInstanceDataBean> instances = ConcertInstanceDao
					.getInstance().getUserConcertInstances(
							reservation.getUserid());

			// id,
			for (int i = 0; i < instances.size(); i++) {
				if (reservation.getConcertid() == instances.get(i)
						.getConcertid()) {
					if (DateParser.getInstance().dateCompare(
							reservation.getConcertDate(),
							instances.get(i).getConcertDate())) {
						ConcertInstanceDataBean instance = instances.get(i);
						String seatType = reservation.getSeatType();

						switch (seatType) {
						case "A":
							instance.setaSeat(-(Integer.parseInt(reservation
									.getSheetNumber())));
							break;
						case "B":
							instance.setbSeat(-(Integer.parseInt(reservation
									.getSheetNumber())));
							break;
						case "C":
							instance.setcSeat(-(Integer.parseInt(reservation
									.getSheetNumber())));
							break;
						case "D":
							instance.setdSeat(-(Integer.parseInt(reservation
									.getSheetNumber())));
							break;
						case "E":
							instance.seteSeat(-(Integer.parseInt(reservation
									.getSheetNumber())));
							break;
						default:
							break;
						}
						break;
					}
				}
			}
			user.setBuyMoney(user.getBuyMoney()
					- Integer.parseInt(reservation.getSheetNumber())
					* WPConstants.RESERVATION_COST);
			user.setPoint(user.getPoint()
					- (int) (Integer.parseInt(reservation.getSheetNumber())
							* WPConstants.RESERVATION_COST * 0.1));

			// Access
			ReservationDao.getInstance().deleteReservation(reserveid);
			UserDao.getInstance().updateMember(user);
			LogUpdater.getInstance().updateLog(
					WPConstants.LOG_USER_DELETERESERVATION, null,
					(String) request.getSession().getAttribute("userid"));

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	private void pushReservationHistoryPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			UserDataBean user = UserDao.getInstance().getMember(
					(String) request.getSession().getAttribute("userid"));
			ArrayList<ReservationDataBean> reservations = ReservationDao
					.getInstance().getReservations(user.getUserid());
			ArrayList<ConcertDataBean> concerts = ConcertDao.getInstance()
					.getConcerts();
			ArrayList<String> concertNames = new ArrayList<String>();

			for (int i = 0; i < reservations.size(); i++) {
				int con = reservations.get(i).getConcertid();
				for (int j = 0; j < concerts.size(); j++) {
					if (concerts.get(j).getConcertId() == con) {
						concertNames.add(concerts.get(i).getConcertName());
						break;
					}
				}
			}
			request.setAttribute("user", user);
			request.setAttribute("reservations", reservations);
			request.setAttribute("concertNames", concertNames);
		} catch (Exception e) {
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

			LogUpdater.getInstance().updateLog(WPConstants.LOG_USER_REGISTER,
					null, (String) request.getSession().getAttribute("userid"));

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
			LogUpdater.getInstance().updateLog(WPConstants.LOG_USER_MODIFY,
					null, (String) request.getSession().getAttribute("userid"));

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