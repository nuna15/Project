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
			} else if (action.equals("reservation")) {
				pushReservationPage(request, response); // 필요한것인가?
			} else if (action.equals("register")) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_CONCERT_REGISTER);
				view.forward(request, response);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean confirm = false;
		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);

		if (request.getParameter("action").equals("")) {
			confirm = pushConcertDetail(request, response);
		} else if (request.getParameter("action").equals("register")) {
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
				Date startDate, finishDate;

				startDate = DateParser.getInstance().calendarToDate(
						request.getParameter("concertStartDate"));
				finishDate = DateParser.getInstance().calendarToDate(
						request.getParameter("concertFinishDate"));

				ConcertDataBean concert = new ConcertDataBean();

				// timeNumber 시간선택이 존재하지 않는다
				// if(request.getParameter(arg0))

				concert.setAllowNumber(0);
				concert.setStartDate(startDate);
				concert.setEndDate(finishDate);
				concert.setConcertName(request.getParameter("concertTitle"));
				concert.setContent(request.getParameter("concertContent"));
				concert.setActor(request.getParameter("concertActor"));
				concert.setSignDate(new Date(System.currentTimeMillis()));
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
