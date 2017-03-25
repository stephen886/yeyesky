package utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * 获取当前的时间日期 yyyy-mm-dd
 * 
 * @author Administrator
 * 
 */
public class GetDate {
	public static String getYMD() {
		Date day = new Date();
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(day);
	}

}
