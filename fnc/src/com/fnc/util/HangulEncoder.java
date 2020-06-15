package com.fnc.util;

import java.io.UnsupportedEncodingException;

import org.apache.log4j.Logger;

public class HangulEncoder {

	private static Logger logger = Logger.getLogger(HangulEncoder.class);

    public static String to8859_1(String ko){
        if(ko==null){
            return null;
        }

        try{
            return new String(ko.getBytes("KSC5601"), "8859_1");
		} catch (UnsupportedEncodingException e) {
			logger.error(e.getClass().getName() + " : " +  e.getMessage());
            return ko;
		} catch (Exception e) {
			logger.error(e.getClass().getName() + " : " +  e.getMessage());
            return ko;
		}
    }

    public static String toKSC5601(String en){
        if(en==null){
            return null;
        }

        try{
            return new String(en.getBytes("8859_1"), "KSC5601");
		} catch (UnsupportedEncodingException e) {
			logger.error(e.getClass().getName() + " : " +  e.getMessage());
			return en;
		} catch (Exception e) {
			logger.error(e.getClass().getName() + " : " +  e.getMessage());
			return en;
		}
    }

}
