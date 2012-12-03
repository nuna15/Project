package utils;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.StringTokenizer;

public class DateParser {
	private static DateParser instance = new DateParser();

	public static DateParser getInstance() {
		return instance;
	}

	private DateParser() {
		// TODO Auto-generated constructor stub

	}

	public Date calendarToDate(String date) {
		Calendar cal;
		Date returnDate;

		cal = Calendar.getInstance();

		ArrayList<String> tempDateTokens = new ArrayList<String>();
		StringTokenizer token = new StringTokenizer(date, "-");
		while (token.hasMoreTokens()) {
			tempDateTokens.add(token.nextToken());
		}
		System.out.println(Integer.parseInt(tempDateTokens.get(0)));
		System.out.println(Integer.parseInt(tempDateTokens.get(1)));
		System.out.println(Integer.parseInt(tempDateTokens.get(2)));

		// Month는 1을 뺴줘야함
		cal.set(Calendar.YEAR, Integer.parseInt(tempDateTokens.get(0)));
		cal.set(Calendar.MONTH, Integer.parseInt(tempDateTokens.get(1)) - 1);
		cal.set(Calendar.DATE, Integer.parseInt(tempDateTokens.get(2)));

		returnDate = new Date(cal.getTimeInMillis());
		return returnDate;
	}
}
