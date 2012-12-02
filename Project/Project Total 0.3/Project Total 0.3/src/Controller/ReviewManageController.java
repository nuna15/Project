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
import dao.ReviewDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.ReviewDataBean;

/**
 * Servlet implementation class ReviewManageController
 */
@WebServlet("/ReviewManageController")
public class ReviewManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewManageController() {
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
						.getRequestDispatcher(Constants.PAGE_URL_REVIEW_MAIN);
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

		if (requestUrl.equals(Constants.PAGE_SERVER_URL
				+ Constants.PAGE_URL_REVIEW_REGISTER)) {
			confirm = pushReviewRegister(request, response);
			if (confirm) {
				RequestDispatcher view = request
						.getRequestDispatcher(Constants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			}
		}
	}

	private boolean pushReviewRegister(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		if (request.getSession().getAttribute("userid") != null) {
			try {
				ReviewDataBean review = new ReviewDataBean();
				review.setUserid((String) request.getSession().getAttribute(
						"userid"));
				review.setScore(0);
				review.setEvaluateNumber(0);
				review.setContents(request.getParameter("reviewContent"));
				review.setReviewName(request.getParameter("reviewName"));
				// Concert Id 가져오는 부분
				ConcertDataBean concert = new ConcertDataBean();
				concert = ConcertDao.getInstance().getConcertId(
						request.getParameter("concertName"));
				review.setConcertid(concert.getConcertId());

				ReviewDao.getInstance().insertReview(review);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
