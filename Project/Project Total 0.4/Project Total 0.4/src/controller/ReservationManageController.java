package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.WPConstants;
import dao.ConcertDao;
import dao.ReservationDao;
import dto.ReservationDataBean;

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
				reservation.setReservationTime(null);
				reservation.setReservationStatus(0);
				reservation.setSheetNumber(request
						.getParameter("ticketAmountSeat"));

				ReservationDao.getInstance().insertReservation(reservation);
				return true;
				// reservation.setConcertid(concertid);

			} catch (Exception e) {

			}
		}
		return false;
	}
}
