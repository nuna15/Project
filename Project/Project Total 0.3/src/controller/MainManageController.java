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
import dao.ReviewDao;
import dto.ConcertDataBean;
import dto.ReviewDataBean;
import dto.UserDataBean;

/**
 * Servlet implementation class MainManageController
 */
@WebServlet("/MainManageController")
public class MainManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainManageController() {
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
		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);
		ArrayList<ConcertDataBean> concertList = ConcertDao.getInstance()
				.getConcerts();
		ArrayList<ReviewDataBean> reviewList = ReviewDao.getInstance()
				.getReviews();

		request.setAttribute("concerts", concertList);
		request.setAttribute("reviews", reviewList);

		RequestDispatcher view = request
				.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
		view.forward(request, response);
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
