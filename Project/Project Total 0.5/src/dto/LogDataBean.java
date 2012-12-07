package dto;

import java.sql.Date;

public class LogDataBean {
	private int logid;
	private String logName;
	private Date logRegisterTime;
	private String cost;
	private String userid;

	public int getLogid() {
		return logid;
	}

	public void setLogid(int logid) {
		this.logid = logid;
	}

	public String getLogName() {
		return logName;
	}

	public void setLogName(String logName) {
		this.logName = logName;
	}

	public Date getLogRegisterTime() {
		return logRegisterTime;
	}

	public void setLogRegisterTime(Date logRegisterTime) {
		this.logRegisterTime = logRegisterTime;
	}

	public String getCost() {
		return cost;
	}

	public void setCost(String cost) {
		this.cost = cost;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}
