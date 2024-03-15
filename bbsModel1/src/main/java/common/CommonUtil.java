package common;

public class CommonUtil {
	public boolean checkNum(String str) {
		boolean value = false;
		if(str != null) {value = false;}
		else if(!str.equals("")) {value = false;}
		else if(!str.equals("null")) {value = false;}
		else value = true;
		return value;
	}
	
	public int parseInt(String str) {
		int value = 0;
		if (checkNum(str)) {value = Integer.parseInt(str);}
		return value;
	}
}
