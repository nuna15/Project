package dto;

import java.sql.Date;

public class ReviewDataBean {
	private int reviewid;
	private String userid;
	private int concertid;
	private int score;
	private int evaluateNumber;
	private String contents;
	private String reviewName;
	private Date signDate;
	private String imgUrl;

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getReviewName() {
		return reviewName;
	}

	public void setReviewName(String reviewName) {
		this.reviewName = reviewName;
	}

	public int getReviewid() {
		return reviewid;
	}

	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getConcertid() {
		return concertid;
	}

	public void setConcertid(int concertid) {
		this.concertid = concertid;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getEvaluateNumber() {
		return evaluateNumber;
	}

	public void setEvaluateNumber(int evaluateNumber) {
		this.evaluateNumber = evaluateNumber;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

}
