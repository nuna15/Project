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

import utils.DateParser;
import utils.LogUpdater;
import constants.WPConstants;
import dao.ConcertDao;
import dao.ConcertInstanceDao;
import dao.LogDao;
import dao.ReservationDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.ConcertInstanceDataBean;
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
				LogUpdater.getInstance().updateLog(
						WPConstants.LOG_RESERVATION_REGISTER, null,
						(String) request.getSession().getAttribute("userid"));
			} else {
				request.setAttribute("errMsg", "Error !");
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
				ConcertDataBean con = ConcertDao.getInstance().getConcertId(
						request.getParameter("concertName"));
				String date = request.getParameter("concertDate");
				int ticketCount = 0;
				boolean check = false;
				Date concertDate = DateParser.getInstance()
						.calendarToDate(date);
				String seat = request.getParameter("ticketAmountSeat");
				ConcertInstanceDataBean tempConcert = ConcertInstanceDao
						.getInstance().getConcertInstance(concertDate,
								con.getConcertId());

				// 예약 기본값 세팅
				reservation.setUserid((String) request.getSession()
						.getAttribute("userid"));
				reservation.setConcertid(con.getConcertId());
				reservation.setTimeNumber(0); // TimeNumber 구현되면 값 가져와서 하도록
				reservation.setReservationStatus(WPConstants.RESERVATION_OK);
				reservation.setSignDate(new Date(System.currentTimeMillis()));
				reservation.setInstanceid(tempConcert.getInstanceid());
				reservation.setConcertDate(tempConcert.getConcertDate());
				reservation.setSeatType(seat);

				String cost = request.getParameter("ticketAmountConcert");

				if (cost.equals("num1")) {
					ticketCount = 1;
				} else if (cost.equals("num2")) {
					ticketCount = 2;
				} else if (cost.equals("num3")) {
					ticketCount = 3;
				} else if (cost.equals("num4")) {
					ticketCount = 4;
				} else if (cost.equals("num5")) {
					ticketCount = 5;
				}
				if (seat.equals("A")) {
					if (tempConcert.getaSeat() + ticketCount < 11)
						tempConcert.setaSeat(ticketCount);
					else {
						check = true;
					}
				} else if (seat.equals("B")) {
					if (tempConcert.getbSeat() + ticketCount < 11)
						tempConcert.setbSeat(ticketCount);
					else {
						check = true;
					}
				} else if (seat.equals("C")) {
					if (tempConcert.getcSeat() + ticketCount < 11)
						tempConcert.setcSeat(ticketCount);
					else {
						check = true;
					}
				} else if (seat.equals("D")) {
					if (tempConcert.getdSeat() + ticketCount < 11)
						tempConcert.setdSeat(ticketCount);
					else {
						check = true;
					}
				} else if (seat.equals("E")) {
					if (tempConcert.geteSeat() + ticketCount < 11)
						tempConcert.seteSeat(ticketCount);
					else {
						check = true;
					}
				}

				/* User 회원 등급 부분 */
				UserDataBean user = UserDao.getInstance().getMember(
						(String) request.getSession().getAttribute("userid"));
				user.setBuyMoney(user.getBuyMoney()
						+ (WPConstants.RESERVATION_COST * ticketCount));
				user.setPoint((int) (user.getPoint() + (WPConstants.RESERVATION_COST * ticketCount) * 0.1));

				if (user.getBuyMoney() > 2000000) {
					user.setLevel(4);
				} else if (user.getBuyMoney() > 1000000) {
					user.setLevel(3);
				} else if (user.getBuyMoney() > 500000) {
					user.setLevel(2);
				}

				/* Log */
				LogDataBean log = new LogDataBean();
				log.setLogName("Reservation Register");
				log.setLogRegisterTime(new Date(System.currentTimeMillis()));
				log.setCost(String.valueOf(WPConstants.RESERVATION_COST
						* ticketCount));
				log.setUserid(request.getParameter("userid"));

				if (!check) {
					reservation.setSheetNumber(String.valueOf(ticketCount));
					ConcertInstanceDao.getInstance()
							.updateInstance(tempConcert);
					ReservationDao.getInstance().insertReservation(reservation);
					UserDao.getInstance().updateMember(user);
					LogDao.getInstance().insertMember(log);
					return true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
