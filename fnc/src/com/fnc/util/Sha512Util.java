package com.fnc.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Sha512Util {
	
	public static String getSha512(String userPassword) {
		String tempPassword = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(userPassword.getBytes());
            byte[] mb = md.digest();
            for (int i=0; i< mb.length;i++){
            	byte temp = mb[i];
            	String s = Integer.toHexString(new Byte(temp));
            	while (s.length() < 2){
            		s = "0" + s;
            	}
            	s = s.substring(s.length()- 2);
            	tempPassword += s;
            }
            
        } catch (NoSuchAlgorithmException e) {
        }
        
        return tempPassword;
    }
}