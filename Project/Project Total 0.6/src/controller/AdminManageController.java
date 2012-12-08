package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ConcertDao;
import dao.ReservationDao;
import dao.ReviewDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.ReservationDataBean;
import dto.ReviewDataBean;
import dto.UserDataBean;
import constants.*;

/**
 * Servlet implementation class AdminManageController
 */
@WebServlet("/AdminManageController")
public class AdminManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminManageController() {
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
		if (request.getSession().getAttribute("userid").equals("admin")) { // 후에
																			// 회원
																			// 등급으로
																			// 판단해야
																			// 함
			String action = request.getParameter("action");

			ArrayList<ConcertDataBean> concerts = ConcertDao.getInstance()
					.getConcerts();
			ArrayList<ReservationDataBean> reservations = ReservationDao
					.getInstance().getReservations();
			ArrayList<ReviewDataBean> reviews = ReviewDao.getInstance()
					.getReviews();
			ArrayList<UserDataBean> users = UserDao.getInstance().getMembers();

			request.setAttribute("concerts", concerts);
			request.setAttribute("reservations", reservations);
			request.setAttribute("reviews", reviews);
			request.setAttribute("users", users);

			if (action.equals("master")) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_ADMIN_MAIN);
				view.forward(request, response);
			} else if (action.equals("status")) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_ADMIN_STATUS);
				view.forward(request, response);
			} else if (action.equals("reserve")) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_ADMIN_RESERVE);
				view.forward(request, response);
			} else if (action.equals("analysis")) {
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_ADMIN_RESERVE);
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
	}

}
