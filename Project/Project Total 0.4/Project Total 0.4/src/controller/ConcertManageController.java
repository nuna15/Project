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

import utils.DateParser;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import constants.WPConstants;
import dao.ConcertDao;
import dao.LogDao;
import dao.UserDao;
import dto.ConcertDataBean;
import dto.LogDataBean;
import dto.UserDataBean;

@WebServlet("/ConcertManageController")
public class ConcertManageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ConcertManageController() {
		super();
		// TODO Auto-generated constructor stub
	}

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

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);

		request.setCharacterEncoding(WPConstants.MAIN_ENCODING);
		boolean first, second;
		first = false;
		second = false;
		// 이미지삽입
		if (request.getSession().getAttribute("userid").equals("admin")) {

			MultipartRequest multi = null;
			File dir;
			UserDataBean user;
			try {
				user = UserDao.getInstance().getMember(
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
						WPConstants.MAIN_ENCODING,
						new DefaultFileRenamePolicy());
				Date startDate = DateParser.getInstance().calendarToDate(
						multi.getParameter("concertStartDate"));
				Date finishDate = DateParser.getInstance().calendarToDate(
						multi.getParameter("concertFinishDate"));
				String imgTitle = multi.getFilesystemName("imgTitle");
				first = true;
				try {
					ConcertDataBean concert = new ConcertDataBean();

					concert.setTimeNumber(0);
					concert.setAllowNumber(0);
					concert.setStartDate(startDate);
					concert.setEndDate(finishDate);
					concert.setConcertName(multi.getParameter("concertTitle"));
					concert.setContent(multi.getParameter("concertContent"));
					concert.setActor(multi.getParameter("concertActor"));

					concert = ConcertDao.getInstance().getConcertId(
							multi.getParameter("concertTitle"));
					concert.setSignDate(new Date(System.currentTimeMillis()));
					second = true;

					if (first && second) {
						concert.setImgUrl(folderPath + "/" + imgTitle);
						concert.setImgUrl(concert.getImgUrl()
								.replace("/", "\\"));
						System.out.println(folderPath);
						ConcertDao.getInstance().insertConcert(concert);

						/* Log */
						System.out.println("Log start");
						LogDataBean log = new LogDataBean();
						log.setLogName("Concert Register");
						log.setLogRegisterTime(new Date(System
								.currentTimeMillis()));
						log.setCost(null);
						log.setUserid((String) request.getSession()
								.getAttribute("userid"));
						LogDao.getInstance().insertMember(log);
						System.out.println("Log end");
					}
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// RequestDispatcher view = request
				// .getRequestDispatcher(WPConstants.PAGE_URL_ADMIN_MAIN);
				// view.forward(request, response);
				response.sendRedirect(WPConstants.PAGE_URL_ADMIN_MAIN);
			}
		}
	}
}