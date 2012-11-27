package dto;

public class ReservationDataBean {
	private int reservationid;
	private String userid;
	private int concertid;
	private int timeNumber;
	private java.sql.Date reservationTime;
	private int reservationStatus;
	private String sheetNumber;

	public int getReservationid() {
		return reservationid;
	}

	public void setReservationid(int reservationid) {
		this.reservationid = reservationid;
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

	public int getTimeNumber() {
		return timeNumber;
	}

	public void setTimeNumber(int timeNumber) {
		this.timeNumber = timeNumber;
	}

	public java.sql.Date getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(java.sql.Date reservationTime) {
		this.reservationTime = reservationTime;
	}

	public int getReservationStatus() {
		return reservationStatus;
	}

	public void setReservationStatus(int reservationStatus) {
		this.reservationStatus = reservationStatus;
	}

	public String getSheetNumber() {
		return sheetNumber;
	}

	public void setSheetNumber(String sheetNumber) {
		this.sheetNumber = sheetNumber;
	}

}
