package Controller;

import java.io.IOException;
import java.sql.Time;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ConcertDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.UserDataBean;

import Constants.Constants;

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
				+ Constants.PAGE_URL_CONCERT_MAIN)) {
			confirm = pushConcertDetail(request, response);
		} else if (requestUrl.equals(Constants.PAGE_SERVER_URL
				+ Constants.PAGE_URL_CONCERT_REGISTER)) {
			confirm = pushConcertRegister(request, response);

			if (confirm == true) {
				RequestDispatcher view = request
						.getRequestDispatcher(Constants.PAGE_URL_MAINPAGE);
				view.forward(request, response);
			} else {
				RequestDispatcher view = request
						.getRequestDispatcher(Constants.PAGE_URL_CONCERT_REGISTER);
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
				concert.setConcertDate(null);
				concert.setAllowNumber(0);
				concert.setStartDate(null);
				concert.setFinishDate(null);
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
				request.setAttribute("concertEndDate", concert.getFinishDate());
				request.setAttribute("concertContent", concert.getContent());
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
