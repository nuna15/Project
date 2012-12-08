package controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.LogUpdater;
import utils.ReviewSortManager;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import constants.WPConstants;
import dao.ConcertDao;
import dao.ReviewDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.ReviewDataBean;
import dto.UserDataBean;

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
		request.setCharacterEncoding(constants.WPConstants.MAIN_ENCODING);
		if (action != null) {
			if (action.equals("index")) {
				pushIndexPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_REVIEW_MAIN);
				view.forward(request, response);
			} else if (action.equals("register")) {
				pushRegisterPage(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_REVIEW_REGISTER);
				view.forward(request, response);
			} else if (action.equals("like")) {
				pushLikeData(request, response);
				RequestDispatcher view = request
						.getRequestDispatcher(WPConstants.PAGE_URL_EXIT);
				view.forward(request, response);
			}
		}
	}

	private void pushLikeData(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		int reviewId = Integer.parseInt(request.getParameter("reviewid"));
		int rating = Integer.parseInt(request.getParameter("rating"));
		ReviewDataBean bean = ReviewDao.getInstance().getReview(reviewId);
		bean.setScore(bean.getScore() + rating); // score는 파라메터로 넘어온것으로 수정
		bean.setScore(bean.getEvaluateNumber() + 1);
		ReviewDao.getInstance().updateReview(bean);
	}

	private void pushRegisterPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<ConcertDataBean> concerts = ConcertDao.getInstance()
				.getConcerts();
		request.setAttribute("concerts", concerts);

	}

	private void pushIndexPage(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<ReviewDataBean> reviews = ReviewDao.getInstance()
				.getReviews();
		ArrayList<ReviewDataBean> reviewRankingList = ReviewDao.getInstance()
				.getRankReviews();
		if (reviewRankingList != null) {
			if (reviewRankingList.size() > 2) {
				ReviewSortManager.getInstance().sortingArrayList(
						reviewRankingList);

				for (int i = 0; i < reviewRankingList.size(); i++) {
					System.out.println(reviewRankingList.get(i).toString());
				}
				request.setAttribute("reviewRanking", reviewRankingList);
			}
		}
		request.setAttribute("reviews", reviews);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);
		boolean first, second;
		first = false;
		second = false;
		// 이미지삽입
		try {
			MultipartRequest multi = null;
			File dir;
			UserDataBean user = UserDao.getInstance().getMember(
					(String) request.getSession().getAttribute("userid"));
			String userid = user.getUserid();
			String saveUserFolder = "WEB-INF/" + "images/" + userid;

			ServletContext context = getServletContext();

			String folderPath = context.getRealPath(saveUserFolder);

			dir = new File(folderPath);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}

			multi = new MultipartRequest(request, folderPath,
					WPConstants.PHOTO_UPLOAD_FILE_MAXSIZE,
					WPConstants.MAIN_ENCODING, new DefaultFileRenamePolicy());
			System.out.println(folderPath);
			String imgTitle = multi.getFilesystemName("imgTitle");
			System.out.println(imgTitle);
			first = true;
			if (request.getSession().getAttribute("userid") != null) {
				try {
					ReviewDataBean review = new ReviewDataBean();

					review.setUserid((String) request.getSession()
							.getAttribute("userid"));
					review.setScore(0);
					review.setEvaluateNumber(0);
					review.setContents(multi.getParameter("reviewContent"));
					review.setReviewName(multi.getParameter("reviewName"));
					ConcertDataBean concert = new ConcertDataBean();

					System.out.println(multi.getParameter("concertName"));
					concert = ConcertDao.getInstance().getConcertId(
							multi.getParameter("concertName"));
					review.setConcertid(concert.getConcertId());
					review.setSignDate(new Date(System.currentTimeMillis()));
					second = true;

					if (first && second) {
						review.setImgUrl(folderPath + "/" + imgTitle);
						review.setImgUrl(review.getImgUrl().replace("/", "\\"));
						ReviewDao.getInstance().insertReview(review);

						// 로그작성
						LogUpdater.getInstance().updateLog(
								WPConstants.LOG_REVIEW_REGISTER,
								null,
								(String) request.getSession().getAttribute(
										"userid"));

						// response.sendRedirect(WPConstants.PAGE_URL_REVIEW_MAIN);
						RequestDispatcher view = request
								.getRequestDispatcher(WPConstants.PAGE_URL_REVIEW_MAIN);
						view.forward(request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (!first || !second) {
			System.out.println("notcommit" + request);
			RequestDispatcher view = request
					.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
			view.forward(request, response);
			// response.sendRedirect(WPConstants.PAGE_URL_REVIEW_MAIN);
		}
		// 이미지는 결국 올라가게 되지만 계속 덮어 씌우도록 할 수 있기 때문에 문제 되지 않을 것
	}
}
