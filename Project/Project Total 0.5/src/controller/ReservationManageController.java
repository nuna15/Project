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

import constants.WPConstants;
import dao.ConcertDao;
import dao.LogDao;
import dao.ReservationDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.LogDataBean;
import dto.ReservationDataBean;
import dto.UserDataBean;

/**
 * Servlet implementation class ReservationManageController
 */
@WebServlet("/ReservationManageController")
public class ReservationManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReservationManageController() {
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
		request.setCharacterEncoding(constants.WPConstants.MAIN_ENCODING);
		if (action != null) {
			if (action.equals("index")) {
				ArrayList<ConcertDataBean> concerts = ConcertDao.getInstance()
						.getConcerts();
				request.setAttribute("concerts", concerts);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_RESERVATION_REGISTER);
				view.forward(request, response);
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
		boolean confirm = false;
		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);

		if (request.getParameter("action").equals("register")) {
			confirm = pushReservationRegister(request, response);
			if (confirm) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			} else {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			}
		}

	}

	private boolean pushReservationRegister(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("userid") != null) {
			try {
				ReservationDataBean reservation = new ReservationDataBean();

				reservation.setUserid((String) request.getSession()
						.getAttribute("userid"));
				reservation.setConcertid(ConcertDao.getInstance()
						.getConcertId(request.getParameter("concertName"))
						.getConcertId());
				reservation.setTimeNumber(0);
				reservation.setReservationStatus(0);
				reservation.setSheetNumber(request
						.getParameter("ticketAmountSeat"));
				reservation.setSignDate(new Date(System.currentTimeMillis()));

				ReservationDao.getInstance().insertReservation(reservation);

				/* User 회원 등급 부분 */
				UserDataBean user = UserDao.getInstance().getMember(
						(String) request.getSession().getAttribute("userid"));
				user.setBuyMoney(user.getBuyMoney()
						+ WPConstants.RESERVATION_COST);
				user.setPoint((int) (user.getPoint() + WPConstants.RESERVATION_COST * 0.1));

				if (user.getBuyMoney() > 2000000) {
					user.setLevel(4);
				} else if (user.getBuyMoney() > 1000000) {
					user.setLevel(3);
				} else if (user.getBuyMoney() > 500000) {
					user.setLevel(2);
				}
				UserDao.getInstance().updateMember(user);

				/* Log */
				LogDataBean log = new LogDataBean();
				log.setLogName("Reservation Register");
				log.setLogRegisterTime(new Date(System.currentTimeMillis()));
				log.setCost(String.valueOf(WPConstants.RESERVATION_COST));
				log.setUserid(request.getParameter("userid"));
				LogDao.getInstance().insertMember(log);

				return true;
			} catch (Exception e) {

			}
		}
		return false;
	}
}
