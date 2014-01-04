package com.qimeng.common.tools;

import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Calendar;
import java.util.Locale;

import com.qimeng.common.Constants;


public class DateFormatUtils {

	/**
	 * 得到应用服务器当前日期，以默认格式显示。
	 * 
	 * @return
	 */
	public static String getFormatedDate() {
		Date date = getCurrentDate();
		SimpleDateFormat dateFormator = new SimpleDateFormat(Constants.DATE_FORMAT);
		return dateFormator.format(date);

	}

	/**
	 * 得到应用服务器当前日期时间，以默认格式显示。
	 * 
	 * @return
	 */
	public static String getFormatedDateTime() {

		Date date = getCurrentDate();
		SimpleDateFormat dateFormator = new SimpleDateFormat(Constants.DATE_TIME_FORMAT);
		return dateFormator.format(date);

	}

	/**
	 * 得到应用服务器的当前时间
	 * 
	 * @return
	 */
	public static Date getCurrentDate() {
		return new Date(System.currentTimeMillis());
	}

	/**
	 * 得到应用服务器的当前时间，毫秒。
	 * 
	 * @return
	 */
	public static long getCurrentTimeMillis() {
		return System.currentTimeMillis();
	}

	/**
	 * 得到应用服务器当前日期 按照指定的格式返回。
	 * 
	 * @param pattern
	 *            格式类型，通过系统常量中定义，如：Constants.DATE_FORMAT_8
	 * @return
	 */
	public static String formatDate(String pattern) {

		Date date = new Date();
		SimpleDateFormat dateFormator = new SimpleDateFormat(pattern);
		String str = dateFormator.format(date);

		return str;
	}

	/**
	 * 转换输入日期 按照指定的格式返回。
	 * 
	 * @param date
	 * @param pattern
	 *            格式类型，通过系统常量中定义，如：Constants.DATE_FORMAT_8
	 * @return
	 */
	public static String formatDate(Date date, String pattern) {

		if (date == null)
			return "";

		SimpleDateFormat dateFormator = new SimpleDateFormat(pattern);
		String str = dateFormator.format(date);

		return str;
	}

	/**
	 * 转换输入日期 按照指定的格式返回。
	 * 
	 * @param date
	 * @param pattern
	 *            格式类型，通过系统常量中定义，如：Constants.DATE_FORMAT_8
	 * @param loc
	 *            locale
	 * @return
	 */
	public static String formatDate(Date date, String pattern, Locale loc) {
		if (pattern == null || date == null) {
			return "";
		}
		String newDate = "";
		if (loc == null)
			loc = Locale.getDefault();
		if (date != null) {
			SimpleDateFormat sdf = new SimpleDateFormat(pattern, loc);
			newDate = sdf.format(date);
		}
		return newDate;
	}

	/**
	 * 将字符时间从一个格式转换成另一个格式。时间的格式，最好通过系统常量定义。 如：
	 * String dateStr = "2006-10-9 12:09:08";
	 * DateFormatUtils.convertDateFormat(dateStr,
	 * Constants.DATE_TIME_FORMAT,
	 * Constants.DATE_FORMAT_8);
	 * 
	 * @param sdate
	 * @param patternFrom
	 *            格式类型，通过系统常量中定义，如：Constants.DATE_FORMAT_8
	 * @param patternTo
	 *            格式类型，通过系统常量中定义，如：Constants.DATE_FORMAT_8
	 * @return
	 */
	public static String convertDateFormat(String dateStr, String patternFrom, String patternTo) {

		if (dateStr == null || patternFrom == null || patternTo == null) {
			return "";
		}

		String newDate = "";

		try {

			Date dateFrom = parseStrToDate(dateStr, patternFrom);
			newDate = formatDate(dateFrom, patternTo);

		} catch (Exception e) {
		}

		return newDate;
	}

	/**
	 * 将时间串按照默认格式Constants.DATE_FORMAT，格式化成Date。
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date parseStrToDate(String dateStr) {

		if (null == dateStr || "".equals(dateStr))
			return null;

		SimpleDateFormat dateFormator = new SimpleDateFormat(Constants.DATE_FORMAT);

		java.util.Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));

		return tDate;
	}

	public static String parseDateStrToDateTimeStr(String dateStr) {

		if (null == dateStr || "".equals(dateStr))
			return null;

		SimpleDateFormat dateFormator = new SimpleDateFormat(Constants.DATE_FORMAT);

		java.util.Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));
		return formatDate(tDate, Constants.DATE_TIME_FORMAT);

	}

	/**
	 * 将时间串按照默认格式Constants.DATE_FORMAT，格式化成Date。
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Calendar parseStrToCalendar(String dateStr) {

		if (null == dateStr || "".equals(dateStr))
			return null;

		SimpleDateFormat dateFormator = new SimpleDateFormat(Constants.DATE_FORMAT);

		java.util.Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));

		Locale loc = Locale.getDefault();
		Calendar cal = new GregorianCalendar(loc);
		cal.setTime(tDate);

		return cal;
	}

	/**
	 * 将时间串按照默认格式Constants.DATE_TIME_FORMAT，格式化成Date。
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date parseStrToDateTime(String dateStr) {

		if (null == dateStr || "".equals(dateStr))
			return null;

		SimpleDateFormat dateFormator = new SimpleDateFormat(Constants.DATE_TIME_FORMAT);

		java.util.Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));

		return tDate;
	}

	/**
	 * 将时间串按照指定格式，格式化成Date。
	 * 
	 * @param date
	 * @param pattern
	 *            格式类型，通过系统常量中定义，如：Constants.DATE_FORMAT_8
	 * @return
	 */

	public static Date parseStrToDate(String dateStr, String pattern) {
		if (null == dateStr || "".equals(dateStr))
			return null;

		SimpleDateFormat dateFormator = new SimpleDateFormat(pattern);

		java.util.Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));

		return tDate;
	}

	/**
	 * 按时间格式相加：
	 * 输入要相加的时间基点（字符串型或时间类型），相加的时长（整型），格式（"year"年、"month"月、"day"日、”hour“时、”minute“分、”second“秒、"week"周）
	 * 输出相加后的时间（字符串型或时间类型）
	 * 
	 * @param dateStr
	 * @param pattern
	 * @param step
	 * @param type
	 *            "year"年、"month"月、"day"日、”hour“时、”minute“分、”second“秒、"week"周
	 *            通过常量DateFormatUtils.YEAR等来设置.
	 * @return
	 */
	public static String addDate(String dateStr, String pattern, int step, String type) {
		if (dateStr == null) {
			return dateStr;
		} else {
			Date date1 = DateFormatUtils.parseStrToDate(dateStr, pattern);

			Locale loc = Locale.getDefault();
			Calendar cal = new GregorianCalendar(loc);
			cal.setTime(date1);

			if (DateFormatUtils.WEEK.equals(type)) {

				cal.add(Calendar.WEEK_OF_MONTH, step);

			} else if (DateFormatUtils.YEAR.equals(type)) {

				cal.add(Calendar.YEAR, step);

			} else if (DateFormatUtils.MONTH.equals(type)) {

				cal.add(Calendar.MONTH, step);

			} else if (DateFormatUtils.DAY.equals(type)) {

				cal.add(Calendar.DAY_OF_MONTH, step);

			} else if (DateFormatUtils.HOUR.equals(type)) {

				cal.add(Calendar.HOUR, step);

			} else if (DateFormatUtils.MINUTE.equals(type)) {

				cal.add(Calendar.MINUTE, step);

			} else if (DateFormatUtils.SECOND.equals(type)) {

				cal.add(Calendar.SECOND, step);

			}

			return DateFormatUtils.formatDate(cal.getTime(), pattern);
		}
	}

	/**
	 * 按时间格式相减：
	 * 输入要相加的时间基点（字符串型或时间类型），相加的时长（整型），格式（"year"年、"month"月、"day"日、”hour“时、”minute“分、”second“秒、"week"周）
	 * 输出相加后的时间（字符串型或时间类型）
	 * 
	 * @param dateStr
	 * @param pattern
	 * @param step
	 * @param type
	 *            "year"年、"month"月、"day"日、”hour“时、”minute“分、”second“秒、"week"周
	 * @return
	 */
	public static String minusDate(String dateStr, String pattern, int step, String type) {

		return addDate(dateStr, pattern, (0 - step), type);

	}

	/**
	 * 日期增加天数
	 * 
	 * @param date
	 * @param days
	 * @return
	 */
	public static Date addDay(Date date, int days) {
		if (date == null) {
			return date;
		} else {
			Locale loc = Locale.getDefault();
			Calendar cal = new GregorianCalendar(loc);
			cal.setTime(date);
			cal.add(Calendar.DAY_OF_MONTH, days);
			return cal.getTime();
		}
	}

	public static int getDays(Date date1, Date date2) {
		if (date1 == null || date2 == null)
			return 0;
		else
			return (int) ((date2.getTime() - date1.getTime()) / 0x5265c00L);
	}

	/**
	 * 日期比较大小
	 * 
	 * @param dateStr1
	 * @param dateStr2
	 * @param pattern
	 * @return
	 */
	public static int compareDate(String dateStr1, String dateStr2, String pattern) {

		Date date1 = DateFormatUtils.parseStrToDate(dateStr1, pattern);
		Date date2 = DateFormatUtils.parseStrToDate(dateStr2, pattern);

		return date1.compareTo(date2);

	}

	/**
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static String getFirstDayInMonth(String dateStr, String pattern) {
		Calendar cal = DateFormatUtils.parseStrToCalendar(dateStr);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);

		cal.add(Calendar.DAY_OF_MONTH, (1 - day));

		return DateFormatUtils.formatDate(cal.getTime(), pattern);
	}

	/**
	 * @param dateStr
	 * @param pattern
	 * @author mzp
	 * @time 20080717
	 * @return
	 */
	public static String getFirstDayInMonth(String dateStr, String pattern,String isZeroSecond) {
		Calendar cal = DateFormatUtils.parseStrToCalendar(dateStr);
		int year=cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour=cal.get(Calendar.HOUR);
		int minute=cal.get(Calendar.MINUTE);
		int second=cal.get(Calendar.SECOND);
		day=1;hour=0;minute=0;second=0;
		cal.clear();
		cal.set(year, month, day, hour, minute, second);
		return DateFormatUtils.formatDate(cal.getTime(), pattern);
	}
	
	/**
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static String getLastDayInMonth(String dateStr, String pattern) {
		Calendar cal = DateFormatUtils.parseStrToCalendar(dateStr);
		int month = cal.get(Calendar.MONTH);
		int day = cal.get(Calendar.DAY_OF_MONTH);

		int maxDayInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		int step = maxDayInMonth - day;

		cal.add(Calendar.DAY_OF_MONTH, step);

		return DateFormatUtils.formatDate(cal.getTime(), pattern);
	}

	/**
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static String getFirstDayInWeek(String dateStr, String pattern) {
		Calendar cal = DateFormatUtils.parseStrToCalendar(dateStr);
		int day = cal.get(Calendar.DAY_OF_WEEK);

		cal.add(Calendar.DAY_OF_MONTH, (1 - day));

		return DateFormatUtils.formatDate(cal.getTime(), pattern);
	}

	/**
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static String getLastDayInWeek(String dateStr, String pattern) {
		Calendar cal = DateFormatUtils.parseStrToCalendar(dateStr);
		int day = cal.get(Calendar.DAY_OF_WEEK);

		cal.add(Calendar.DAY_OF_MONTH, (6 - day));

		return DateFormatUtils.formatDate(cal.getTime(), pattern);
	}

	public static long calendarDayPlus(String dateStr1, String dateStr2) {
		
		if (dateStr1 == null || dateStr2 == null||dateStr1.equals("")||dateStr2.equals(""))
			return 0;
		Date date1 = DateFormatUtils.parseStrToDate(dateStr1);
		Date date2 = DateFormatUtils.parseStrToDate(dateStr2);
		Calendar c1 = Calendar.getInstance();
		c1.setTime(date1);
		Calendar c2 = Calendar.getInstance();
		c2.setTime(date2);
		long t1 = c1.getTimeInMillis();
		long t2 = c2.getTimeInMillis();
		long day = (t2 - t1) / (1000 * 60 * 60 * 24);
		return day;
	}
	
	/**
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static int calendarPlus(String dateStr1, String dateStr2) {
		
		if (dateStr1 == null || dateStr2 == null||dateStr1.equals("")||dateStr2.equals(""))
			return 0;
		
		Calendar cal1 = DateFormatUtils.parseStrToCalendar(dateStr1);
		
		Calendar cal2 = DateFormatUtils.parseStrToCalendar(dateStr2);
		
		int dataStr1Year = cal1.get(Calendar.YEAR);
		int dataStr2Year = cal2.get(Calendar.YEAR);
		
		int dataStr1Month = cal1.get(Calendar.MONTH);
		int dataStr2Month = cal2.get(Calendar.MONTH);


		return ((dataStr2Year*12+dataStr2Month+1)-(dataStr1Year*12+dataStr1Month));
		
	}

	public final static String YEAR = "year";

	public final static String MONTH = "month";

	public final static String DAY = "day";

	public final static String HOUR = "hour";

	public final static String MINUTE = "minute";

	public final static String SECOND = "second";

	public final static String WEEK = "week";

}
