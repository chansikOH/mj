package kr.co.mj.util;

public class FormatUtil {
	 
	  public static String phone(String src) {
	    if (src == null) {
	      return "null";
	    }
	    if (src.length() == 8) {
	      return src.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2");
	    } else if (src.length() == 12) {
	      return src.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4})$", "$1-$2-$3");
	    }
	    return src.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");
	  }
	}