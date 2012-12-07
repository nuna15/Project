package utils;

import java.sql.Date;

import dao.LogDao;
import dto.LogDataBean;

public class LogUpdater {
	private static LogUpdater instance = new LogUpdater();

	public static LogUpdater getInstance() {
		return instance;
	}

	private LogUpdater() {
		// TODO Auto-generated constructor stub
	}

	public void updateLog(String logName, String cost, String userId) {
		try {
			LogDataBean log = new LogDataBean();
			log.setLogName("Concert Instance Register");
			log.setLogRegisterTime(new Date(System.currentTimeMillis()));
			log.setCost(cost);
			log.setUserid(userId);
			LogDao.getInstance().insertMember(log);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
