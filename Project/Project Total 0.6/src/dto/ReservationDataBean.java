package dto;

import java.sql.Date;

public class ReservationDataBean {
	private int reservationid;
	private String userid;
	private int concertid;
	private int timeNumber;
	private int reservationStatus;
	private String sheetNumber;
	private Date signDate;
	private int instanceid;
	private Date concertDate;
	private String seatType;

	public String getSeatType() {
		return seatType;
	}

	public void setSeatType(String seatType) {
		this.seatType = seatType;
	}

	public Date getConcertDate() {
		return concertDate;
	}

	public void setConcertDate(Date concertDate) {
		this.concertDate = concertDate;
	}

	public int getInstanceid() {
		return instanceid;
	}

	public void setInstanceid(int instanceid) {
		this.instanceid = instanceid;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

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
