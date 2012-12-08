package dto;

import java.sql.Date;

public class ConcertDataBean {
	private int concertId;
	private int timeNumber;
	private Date startTime;
	private Date endTime;
	private String concertName;
	private String content;
	private String actor;
	private Date signDate;
	private String imgUrl;
	private int score;
	private int clickCount;

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getClickCount() {
		return clickCount;
	}

	public void setClickCount(int clickCount) {
		this.clickCount = clickCount;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getContent() {
		return content;
	}

	public String getActor() {
		return actor;
	}

	public void setActor(String actor) {
		this.actor = actor;
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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgurl) {
		this.imgUrl = imgurl;
	}

}
