package dto;

public class ConcertDataBean {
	private int concertId;
	private int timeNumber;
	private java.sql.Date concertDate;
	private int allowNumber;
	private java.sql.Time startTime;
	private java.sql.Time endTime;
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

	public java.sql.Time getStartDate() {
		return startTime;
	}

	public void setStartDate(java.sql.Time startTime) {
		this.startTime = startTime;
	}

	public java.sql.Time getFinishDate() {
		return endTime;
	}

	public void setFinishDate(java.sql.Time endTime) {
		this.endTime = endTime;
	}

	public String getConcertName() {
		return concertName;
	}

	public void setConcertName(String concertName) {
		this.concertName = concertName;
	}

}
