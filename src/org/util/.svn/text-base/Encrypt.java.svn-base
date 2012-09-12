package org.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Description:This class is used to conduct MD5 algorithm to the passwords
 * 
 * @author wangxinalex
 * @version 1.0
 */
public class Encrypt {

	public final static String getMD5(String str) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte mdBytes[] = md.digest();

			String hashCode = "";
			for (int i = 0; i < mdBytes.length; i++) {
				int temp;
				if (mdBytes[i] < 0)
					temp = 256 + mdBytes[i];
				else
					temp = mdBytes[i];
				if (temp < 16)
					hashCode += "0";
				hashCode += Integer.toString(temp, 16);
			}
			return hashCode;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

}