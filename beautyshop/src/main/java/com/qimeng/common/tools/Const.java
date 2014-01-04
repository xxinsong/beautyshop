package com.qimeng.common.tools;

import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("unchecked")
public class Const {

	private static Map getEmptyMap() {
		return new HashMap();
	}

	public static int getPageSize(Map m) {
		return ((Integer) m.get("pageSize")).intValue();
	}

	public static int getPageIndex(Map m) {
		return ((Integer) m.get("pageIndex")).intValue();
	}

	/**
	 * 根据tStr字段 构建新map
	 * 
	 * @param sm
	 *            原map
	 * @param tStr
	 *            从原map，根据tStr字段作为key，构建需要的map
	 * @return
	 */
	public static Map getMapForTargetStr(Map sm, String tStr) {
		if (sm == null || sm.isEmpty() || tStr == null || "".equals(tStr.trim())) {
			return getEmptyMap();
		}
		Map tm = new HashMap();
		String[] tStrArray = tStr.split(",");
		for (int i = 0, j = tStrArray.length; i < j; i++) {
			String n = tStrArray[i];
			if (sm.get(n) != null) {
				tm.put(n, (String) sm.get(n));
			}
		}
		return tm;
	}

	public static boolean containValue(Map m, String name) {
		return m.get(name) != null;
	}

	public static boolean containStrValue(Map m, String name) {
		if (!containValue(m, name)) {
			return false;
		}
		String t = (String) m.get(name);
		return t != null && !"".equals(t.trim());
	}

	public static String getStrValue(Map m, String name) {
		Object t = m.get(name);
		if (t == null) {
			return "";
		}
		return String.valueOf(m.get(name)).trim();
	}

	public static String native2Ascii(String str) {
		char[] chars = str.toCharArray();
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < chars.length; i++) {
			sb.append(char2Ascii(chars[i]));
		}
		return sb.toString();
	}

	private static String PREFIX = "\\u";

	private static String char2Ascii(char c) {
		if (c > 255) {
			StringBuilder sb = new StringBuilder();
			sb.append(PREFIX);
			int code = (c >> 8);
			String tmp = Integer.toHexString(code);
			if (tmp.length() == 1) {
				sb.append("0");
			}
			sb.append(tmp);
			code = (c & 0xFF);
			tmp = Integer.toHexString(code);
			if (tmp.length() == 1) {
				sb.append("0");
			}
			sb.append(tmp);
			return sb.toString();
		} else {
			return Character.toString(c);
		}
	}

	public static String ascii2Native(String str) {
		StringBuilder sb = new StringBuilder();
		int begin = 0;
		int index = str.indexOf(PREFIX);
		while (index != -1) {
			sb.append(str.substring(begin, index));
			sb.append(ascii2Char(str.substring(index, index + 6)));
			begin = index + 6;
			index = str.indexOf(PREFIX, begin);
		}
		sb.append(str.substring(begin));
		return sb.toString();
	}

	private static char ascii2Char(String str) {
		if (str.length() != 6) {
			throw new IllegalArgumentException("Ascii string of a native character must be 6 character.");
		}
		if (!PREFIX.equals(str.substring(0, 2))) {
			throw new IllegalArgumentException("Ascii string of a native character must start with \"\\u\".");
		}
		String tmp = str.substring(2, 4);
		int code = Integer.parseInt(tmp, 16) << 8;
		tmp = str.substring(4, 6);
		code += Integer.parseInt(tmp, 16);
		return (char) code;
	}

}