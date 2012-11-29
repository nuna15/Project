package dto;

public class ConcertDataBean {
	private int concertId;
	private int timeNumber;
	private java.sql.Date concertDate;
	private int allowNumber;
	private java.sql.Time startTime;
	private java.sql.Time endTime;
	private String concertName;

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

	public java.sql.Date getConcertDate() {
		return concertDate;
	}

	public void setConcertDate(java.sql.Date concertDate) {
		this.concertDate = concertDate;
	}

	public int getAllowNumber() {
		return allowNumber;
	}

	public void setAllowNumber(int allowNumber) {
		this.allowNumber = allowNumber;
	}

	public java.sql.Time getStartTime() {
		return startTime;
	}

	public void setStartTime(java.sql.Time startTime) {
		this.startTime = startTime;
	}

	public java.sql.Time getEndTime() {
		return endTime;
	}

	public void setEndTime(java.sql.Time endTime) {
		this.endTime = endTime;
	}

	public String getConcertName() {
		return concertName;
	}

	public void setConcertName(String concertName) {
		this.concertName = concertName;
	}

}
