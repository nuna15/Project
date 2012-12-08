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

	public Calendar dateToCalendar(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(date.getTime());
		return cal;
	}

	public boolean dateCompare(Date one, Date two) {

		Calendar cal1 = dateToCalendar(one);
		Calendar cal2 = dateToCalendar(two);

		if (cal1.get(Calendar.YEAR) == cal2.get(Calendar.YEAR)) {
			if (cal1.get(Calendar.MONTH) == cal2.get(Calendar.MONTH)) {
				if (cal1.get(Calendar.DATE) == cal2.get(Calendar.DATE)) {
					return true;
				}
			}
		}
		return false;
	}
}
