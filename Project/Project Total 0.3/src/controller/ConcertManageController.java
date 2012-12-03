package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.WPConstants;
import dao.ConcertDao;
import dto.ConcertDataBean;

/**
 * Servlet implementation class ConcertManager
 */
@WebServlet("/ConcertManageController")
public class ConcertManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ConcertManageController() {
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
				pushIndexPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_CONCERT_MAIN);
				view.forward(request, response);
			} else if (action.equals("concert")) {
				pushRegisterPage(request, response);
			} else if (action.equals("reservation")) {
				pushReservationPage(request, response);
			}
		}
	}

	private void pushIndexPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<ConcertDataBean> concerts = ConcertDao.getInstance()
				.getConcerts();
		request.setAttribute("concerts", concerts);

	}

	private void pushReservationPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void pushRegisterPage(HttpServletRequest request,
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
		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);

		if (requestUrl.equals(WPConstants.PAGE_SERVER_URL
				+ WPConstants.PAGE_URL_CONCERT_MAIN)) {
			confirm = pushConcertDetail(request, response);
		} else if (requestUrl.equals(WPConstants.PAGE_SERVER_URL
				+ WPConstants.PAGE_URL_CONCERT_REGISTER)) {
			confirm = pushConcertRegister(request, response);

			if (confirm == true) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			} else {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_CONCERT_REGISTER);
				view.forward(request, response);
			}
		}
	}

	private boolean pushConcertRegister(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("userid").equals("admin")) {
			try {
				ConcertDataBean concert = new ConcertDataBean();
				concert.setTimeNumber(0);
				concert.setAllowNumber(0);
				concert.setStartDate(null);
				concert.setEndDate(null);
				concert.setConcertName(request.getParameter("concertTitle"));
				concert.setContent(request.getParameter("concertContent"));
				concert.setActor(request.getParameter("concertActor"));
				ConcertDao.getInstance().insertConcert(concert);

				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	private boolean pushConcertDetail(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("userid").equals("adminstrator")) {
			try {
				ConcertDataBean concert;
				concert = ConcertDao.getInstance().getConcert(
						Integer.parseInt(request.getParameter("concertid")));
				request.setAttribute("concertName", concert.getConcertName());
				request.setAttribute("concertActor", concert.getActor());
				request.setAttribute("concertStartDate", concert.getStartDate());
				request.setAttribute("concertFinishDate", concert.getEndDate());
				request.setAttribute("concertContent", concert.getContent());
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
