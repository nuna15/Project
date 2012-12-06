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
	private String actor;
	private Date signDate;
	private String imgUrl;
	private int standSeat;
	private int normalSeat;
	private int sSeat;

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

	public int getStandSeat() {
		return standSeat;
	}

	public void setStandSeat(int standSeat) {
		this.standSeat = standSeat;
	}

	public int getNormalSeat() {
		return normalSeat;
	}

	public void setNormalSeat(int normalSeat) {
		this.normalSeat = normalSeat;
	}

	public int getsSeat() {
		return sSeat;
	}

	public void setsSeat(int sSeat) {
		this.sSeat = sSeat;
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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgurl) {
		this.imgUrl = imgurl;
	}

}
