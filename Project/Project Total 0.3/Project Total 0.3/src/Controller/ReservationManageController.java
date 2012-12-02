package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.Constants;

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
		request.setCharacterEncoding(Constants.MAIN_ENCODING);
		if (action != null) {
			if (action.equals("index")) {
				pushIndexPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(Constants.PAGE_URL_RESERVATION_REGISTER);
				view.forward(request, response);
			}
		}
	}

	private void pushIndexPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

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

		if (requestUrl
				.equals((Constants.PAGE_SERVER_URL + Constants.PAGE_URL_RESERVATION_REGISTER))) {
			confirm = pushReservationRegister(request, response);
			if (confirm) {
				RequestDispatcher view = request
						.getRequestDispatcher(Constants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			} else { // 수정 안됨
				RequestDispatcher view = request
						.getRequestDispatcher(Constants.PAGE_URL_MAINPAGE);
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
