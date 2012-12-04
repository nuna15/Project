/*package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import constants.WPConstants;

import dao.UserDao;
import dto.UserDataBean;

@WebServlet("/PhotoManageServlet")
public class PhotoManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String userid;
	private String folderPath;
	private String saveUserFolder;
	private String saveReviewFolder;
	private String fileName;
	private String imgTitle;

	public PhotoManageServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		try {
			MultipartRequest multi = null;

			UserDataBean user = UserDao.getInstance().getMember(
					(String) request.getSession().getAttribute("userid"));
			this.userid = user.getUserid();
			saveUserFolder = this.userid; // Userid 를 통한 폴더 경로

			ServletContext context = getServletContext();
			folderPath = context.getRealPath(saveUserFolder);

			multi = new MultipartRequest(request, folderPath,
					WPConstants.PHOTO_UPLOAD_FILE_MAXSIZE,
					WPConstants.MAIN_ENCODING, new DefaultFileRenamePolicy());

			imgTitle = multi.getParameter("imgTitle");
			System.out.println(imgTitle);
			RequestDispatcher view = request
					.getRequestDispatcher(WPConstants.PAGE_URL_MAINPAGE);
			view.forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
*/