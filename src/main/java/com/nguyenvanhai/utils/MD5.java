package com.nguyenvanhai.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	public static String md5(String input) {
		String result = "";
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("MD5");
			md.update(input.getBytes());
			byte[] bytes = md.digest();
			BigInteger hash = new BigInteger(1, bytes);
			result = hash.toString(16);
			while (result.length() < 32) {
				result = "0" + result;
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
