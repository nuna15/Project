package Controller;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import Constants.Constants;
import dao.UserDao;
import dto.ReservationDataBean;
import dto.ReviewDataBean;
import dto.UserDataBean;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserManageController")
public class UserManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserManageController() {
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
		String op = request.getParameter("op");
		String actionUrl = "";
		boolean flag;

		String id = this.getIdFromParameter(request.getParameter("id"));

		if (!id.equals(Constants.CONTROLLER_ERROR_String_VALUE)) {
			try {
				if (op.equals("index")) {
					pushIndex(request, response, id);
					actionUrl = "index.jsp";
				} else if (op.equals("modify")) {
					pushModify(request, response, id);
					actionUrl = "modify.jsp";
				} else if (op.equals("reserveInformation")) {
					pushReservationInformation(request, response, id);
					actionUrl = "reserveInformation.jsp";
				} else if (op.equals("concernConcert")) {
					pushConcernConcert(request, response, id);
					actionUrl = "concernConcert.jsp";
				} else if (op.equals("contactHistory")) {
					pushContactHistory(request, response, id);
					actionUrl = "contactHistory.jsp";
				}
			} catch (Exception e) {
				request.setAttribute("Error", e.getMessage());
				actionUrl = "error.jsp";
				e.printStackTrace();
			}
		} else {

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(actionUrl);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		pushLogin(request, response);
		response.sendRedirect("http://localhost:8080/Project_Total_0.2/mypage.jsp");
	}

	private void pushLogin(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub

		if (loginConfirm(request, response)) {
			try {
				UserDataBean user;
				user = UserDao.getInstance().getMember(
						(String) request.getParameter("userid"));
				HttpSession session = request.getSession();
				session.setAttribute("userid", user.getUserid());
				// RequestDispatcher dispatcher = getServletContext()
				// .getRequestDispatcher("/mainpage.jsp");
				// dispatcher.forward(request, response);
				System.out.println("success");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("Login no confirm");
		}
	}

	private String getIdFromParameter(String id) {
		if (id != null)
			return id;
		return Constants.CONTROLLER_ERROR_String_VALUE;
	}

	private void pushIndex(HttpServletRequest request,
			HttpServletResponse response, String id) {
		try {
			UserDataBean user;
			ReservationDataBean reservation;
			ReviewDataBean review;

			user = UserDao.getInstance().getMember(id);
			// reservation = ReservationDao.getInstance().유저의 예약
			// review = ReviewDao.getInstance().해당 공연의 리뷰

			request.setAttribute("user", user);
			// request.setAttribute("reservation", reservation);
			// request.setAttribute("review", review);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void pushModify(HttpServletRequest request,
			HttpServletResponse response, String id) {
		try {
			UserDataBean user;

			user = UserDao.getInstance().getMember(id);

			request.setAttribute("user", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void pushReservationInformation(HttpServletRequest request,
			HttpServletResponse response, String id) {
		try {
			// ReservationDataBean reservation;
			// ConcertDataBean concert;

			// concert = ConcertDao.getInstance().getConcert(
			// request.getAttribute("concert"));
			// reservation = ReservationDao.getInstance().getReservation(id0);
		} catch (Exception e) {

		}
	}

	private void pushConcernConcert(HttpServletRequest request,
			HttpServletResponse response, String id) {
		try {
			// 카트
		} catch (Exception e) {

		}
	}

	private void pushContactHistory(HttpServletRequest request,
			HttpServletResponse response, String id) {
		try {
			// 1:1문의 내역 빈넣어야함
		} catch (Exception e) {

		}
	}

	private boolean loginConfirm(HttpServletRequest request,
			HttpServletResponse response) {
		if (request.getParameter("userid") != null
				&& request.getParameter("password") != null) {
//			try {
//				UserDao.getInstance().confirmId(request.getParameter("userid"));
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			return true;
		}
		return false;
	}
}