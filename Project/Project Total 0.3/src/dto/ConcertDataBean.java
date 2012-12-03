package dto;

import java.sql.Date;

public class ConcertDataBean {
	private int concertId;
	private int timeNumber;
	private int allowNumber;
	private Date startTime;
	private Date endTime;
	private String concertName;
	private String content;
	private String Actor;

	public String getContent() {
		return content;
	}

	public String getActor() {
		return Actor;
	}

	public void setActor(String actor) {
		Actor = actor;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getConcertId() {
		return concertId;
	}

	public void setConcertId(int concertId) {
		this.concertId = concertId;
	}

	public int getTimeNumber() {
		return timeNumber;
	}

	public void setTimeNumber(int timeNumber) {
		this.timeNumber = timeNumber;
	}

	public int getAllowNumber() {
		return allowNumber;
	}

	public void setAllowNumber(int allowNumber) {
		this.allowNumber = allowNumber;
	}

	public Date getStartDate() {
		return startTime;
	}

	public void setStartDate(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndDate() {
		return endTime;
	}

	public void setEndDate(Date endTime) {
		this.endTime = endTime;
	}

	public String getConcertName() {
		return concertName;
	}

	public void setConcertName(String concertName) {
		this.concertName = concertName;
	}

}
