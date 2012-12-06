package dto;

import java.sql.Date;

public class UserDataBean {

	private String userid;
	private String password;
	private String name;
	private String ssn1;
	private String ssn2;
	private Date signDate;
	private String facebookid;
	private int level;
	private int buyMoney;
	private int point;

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getBuyMoney() {
		return buyMoney;
	}

	public void setBuyMoney(int buyMoney) {
		this.buyMoney = buyMoney;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSsn1() {
		return ssn1;
	}

	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}

	public String getSsn2() {
		return ssn2;
	}

	public void setSsn2(String ssn2) {
		this.ssn2 = ssn2;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getFacebookid() {
		return facebookid;
	}

	public void setFacebookid(String facebookid) {
		this.facebookid = facebookid;
	}

}