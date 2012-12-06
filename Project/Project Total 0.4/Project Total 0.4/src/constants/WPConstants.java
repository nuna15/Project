package constants;

public class WPConstants {

	// ERROR
	public static final String CONTROLLER_ERROR_String_VALUE = "Not found";
	public static final int CONTROLLER_ERROR_INT_VALUE = -1;

	// ENCODING
	public static final String MAIN_ENCODING = "utf-8";

	// PAGES
	public static final String PAGE_SERVER_URL = "http://localhost:8080/Project_Total_0.2/";
	public static final String PAGE_URL_MAINPAGE = "mainpage.jsp";

	public static final String PAGE_URL_USER_LOGIN = "login.jsp";
	public static final String PAGE_URL_USER_MODIFY = "mypage_modify.jsp";
	public static final String PAGE_URL_USER_MYPAGE = "mypage.jsp";
	public static final String PAGE_URL_USER_SIGNUP = "register.jsp";

	public static final String PAGE_URL_CONCERT_REGISTER = "admin_concert_input.jsp";
	public static final String PAGE_URL_CONCERT_MAIN = "information.jsp";

	public static final String PAGE_URL_RESERVATION_REGISTER = "reserve.jsp";

	public static final String PAGE_URL_REVIEW_REGISTER = "review_input.jsp";
	public static final String PAGE_URL_REVIEW_MAIN = "review.jsp";

	public static final String PAGE_URL_ADMIN_MAIN = "admin_master.jsp";
	public static final String PAGE_URL_ADMIN_RESERVE = "admin_reserve.jsp";
	public static final String PAGE_URL_ADMIN_STATUS = "admin_status.jsp";

	// Photo Upload
	public static final String PHOTO_UPLOAD_PATH_MAIN = "";
	public static final int PHOTO_UPLOAD_FILE_MAXSIZE = 10 * 1024 * 1024;

	public static final int RESERVATION_COST = 7000;

	public static enum EUserLevelItems {
		normal("일반회원"), exellent("우수회원"), admin("관리자");

		private String name;

		private EUserLevelItems(String s) {
			this.name = s;
		}

		public String getName() {
			return this.name;
		}
	}
}
