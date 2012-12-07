package dto;

import java.sql.Date;

public class ConcertInstanceDataBean {
	private int instanceid;
	private int timeNumber;
	private int seatCount;
	private Date concertDate;
	private int concertid;
	private int aSeat;
	private int bSeat;
	private int cSeat;
	private int dSeat;
	private int eSeat;

	public ConcertInstanceDataBean() {
		// TODO Auto-generated constructor stub
		aSeat = 0;
		bSeat = 0;
		cSeat = 0;
		dSeat = 0;
		eSeat = 0;
		seatCount = 0;
		timeNumber = 0;
	}

	public int getConcertid() {
		return concertid;
	}

	public int getaSeat() {
		return aSeat;
	}

	public void setaSeat(int aSeat) {
		this.aSeat += aSeat;
	}

	public int getbSeat() {
		return bSeat;
	}

	public void setbSeat(int bSeat) {
		this.bSeat += bSeat;
	}

	public int getcSeat() {
		return cSeat;
	}

	public void setcSeat(int cSeat) {
		this.cSeat += cSeat;
	}

	public int getdSeat() {
		return dSeat;
	}

	public void setdSeat(int dSeat) {
		this.dSeat += dSeat;
	}

	public int geteSeat() {
		return eSeat;
	}

	public void seteSeat(int eSeat) {
		this.eSeat += eSeat;
	}

	public void setConcertid(int concertid) {
		this.concertid = concertid;
	}

	public int getInstanceid() {
		return instanceid;
	}

	public void setInstanceid(int instanceid) {
		this.instanceid = instanceid;
	}

	public int getTimeNumber() {
		return timeNumber;
	}

	public void setTimeNumber(int timeNumber) {
		this.timeNumber = timeNumber;
	}

	public int getSeatCount() {
		return seatCount;
	}

	public void setSeatCount(int seatCount) {
		this.seatCount = seatCount;
	}

	public Date getConcertDate() {
		return concertDate;
	}

	public void setConcertDate(Date concertDate) {
		this.concertDate = concertDate;
	}
}