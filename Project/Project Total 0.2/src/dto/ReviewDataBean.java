package dto;

public class ReviewDataBean {
	private int reviewid;
	private String userid;
	private int concertid;
	private int score;
	private int evaluateNumber;
	private String contents;

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
