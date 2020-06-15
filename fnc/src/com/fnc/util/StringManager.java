package com.fnc.util;

import java.io.IOException;
import java.io.Reader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Clob;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
//import oracle.sql.CLOB;

import org.json.simple.JSONObject;

public class StringManager {

    /**
    * 해당 문자열에서 older String 을 newer String 으로 교체한다.
    @param original 전체 String
    @param older 전체 String 중 교체 전 문자 String
    @param newer 전체 String 중 교체 후 문자 String
    @return result 교체된 문자열을 반환함
    */
    public static String replace(String original, String older, String newer) {
        String result = original;

        if(original != null) {
            int idx = result.indexOf(older);
            int newLength = newer.length();

            while(idx >= 0) {
                if (idx == 0) {
                    result = newer + result.substring(older.length());
                }else {
                    result = result.substring(0, idx) + newer + result.substring(idx + older.length());
                }
                idx = result.indexOf(older, idx + newLength);
            }
        }
        return result;
    }

    /**
    * java.lang.String 패키지의 trim() 메소드와 기능은 동일, null 체크만 함
    @param str 전체 문자열
    @return result  trim 된 문자열을 반환함
    */
    public static String trim(String str) throws Exception {
        String result = "";

        if(str != null)
            result = str.trim();

        return result;
    }

    /**
    * java.lang.String 패키지의 substring() 메소드와 기능은 동일, null 체크만 함
    @param str 전체 문자열
    @param beginIndex
    @param endIndex
    @return result  substring 된 문자열을 반환함
    */
    public static String substring(String str, int beginIndex, int endIndex) {
        String result = "";

        if(str != null)
            result = str.substring(beginIndex, endIndex);

        return result;
    }

    /**
    * java.lang.String 패키지의 substring() 메소드와 기능은 동일, null 체크만 함
    @param str 전체 문자열
    @param beginIndex
    @return result  substring 된 문자열을 반환함
    */
    public static String substring(String str, int beginIndex) {
        String result = "";

        if(str != null)
            result = str.substring(beginIndex);

        return result;
    }

    /**
    *java.lang.String 패키지의 substring() 메소드와 기능은 동일한데 오른쪽 문자끝부터 count 를 해서 자름
    @param str 전체 문자열
    @param count  오른쪽 문자끝(1) 부터 count 까지
    @return result  substring 된 문자열을 반환함
    */
    public static String rightstring(String str, int count) throws Exception {
        if (str == null) return null;

        String result = null;
        try {
            if (count == 0)     //      갯수가 0 이면 공백을
                result = "";
            else if (count > str.length())    //  문자열 길이보다 크면 문자열 전체를
                result = str;
            else
                result = str.substring(str.length()-count,str.length());  //  오른쪽 count 만큼 리턴
        }
        catch (Exception ex) {
            throw new Exception("StringManager.rightstring(\""+str+"\","+count+")\r\n"+ex.getMessage());
        }
        return result;
    }

     /**
    * null 체크
    @param str 전체 문자열
    @return str  null 인경우 "" 을, 아니면 원래의 문자열을 반환한다.
    */
    public static String chkNull(String str) {
        if (str == null)
            return "";
        else
            return str.trim();
    }
    
    /**
     * null 체크
     @param str 전체 문자열
     @return str  null 인경우 "" 을, 아니면 원래의 문자열을 반환한다.
     */
     public static String chkNull(Object obj) {
         if (obj == null)
             return "";
         else
             return obj.toString().trim();
     }
    
    /**
     * null 체크
     @param str 전체 문자열
     @return str  null 인경우 "" 을, 아니면 원래의 문자열을 반환한다.
     */
     public static String chkNull(String str, String str1) {
         if (str == null || "".equals(str))
             return str1;
         else
             return str.trim();
     }

    /**
     * 숫자앞에 0 으로 채우기,  (숫자,길이)
     */
    public static String addZero(int chkNumber, int chkLen) {
        String temp = null;
        temp = String.valueOf(chkNumber);
        int len = temp.length();

        if (len < chkLen) {
            for (int i = 1; i <= (chkLen - len); i++) {
                temp = "0" + temp;
            }
        }
        return temp;
    }

     /**
    * String 형을 int 형으로 변환, null 및 "" 체크
    @param str 전체 문자열
    @return null 및 "" 일 경우 0 반환
    */
    public static int toInt(String str) {
        if (str == null || str.trim().equals(""))
            return 0;
        else
            return Integer.parseInt(str);
    }

     /**
    * String 형을 int 형으로 변환, null 및 "" 체크
    @param str 전체 문자열
    @return null 및 "" 일 경우 0 반환
    */
    public static double toDouble(String str) {
        if (str == null || str.trim().equals(""))
            return 0;
        else
            return Double.parseDouble(str);
    }

     /**
    * Base64로 암호화
    @param str 전체 문자열
    @return Base64로 암호화된 문자열
    public static String BASE64Encode(String str) {
        String result = "";
        BASE64Encoder encoder;

        try {
            encoder = new BASE64Encoder();
            result = encoder.encode(str.getBytes());
        }
        catch(Exception e) {}
        return result;
    }
      */

     /**
    * Base64로 복호화
    @param str 전체 문자열
    @return Base64로 복호화된 문자열
    public static String BASE64Decode(String str) {
        String result = "";
        BASE64Decoder decoder;

        try {
            decoder = new BASE64Decoder();
            result = new String(decoder.decodeBuffer(str));
        }
        catch(Exception e) {}

        return result;
    }
      */

     /**
    * URLEncoder 로 암호화
    @param str 전체 문자열
    @return URLEncoder로 복호화된 문자열
    */
    public static String URLEncode(String str) throws Exception {
        String result = "";
        try {
            if(str != null)
                result = URLEncoder.encode(str);
        }
        catch (Exception ex) {
            throw new Exception("StringManager.URLEncode(\""+str+"\")\r\n"+ex.getMessage());
        }
        return result;
    }

    public static String korEncode(String str) throws UnsupportedEncodingException {
        if(str == null) return null;
        return new String(str.getBytes("8859_1"), "KSC5601");
    }

    public static String engEncode(String str) throws UnsupportedEncodingException {
        if(str == null) return null;
        return new String(str.getBytes("KSC5601"), "8859_1");
    }

    /**
    * SQL Query 문에서 value 값의 ' ' 를 만들어 주기 위한 메소드
    @param str   ' ' 안에 들어갈 변수 값
    @return   'str' 로 리턴됨
    */
    public static String makeSQL(String str) {
        String result = "";
        if(str != null)
            result = "'" + chkNull(replace(str, "'", "")) + "'";
        return result;
    }

    /**
    * 제목을 보여줄때 제한된 길이를 초과하면 뒷부분을 짜르고 "..." 으로 대치한다.
    @param title(제목등의 문자열), max(최대길이)
    @return title(변경된 문자열)
    */
    public static String formatTitle(String title, int max) {
    	if (title==null) return null;

    	if (title.length() <= max)
    	    return title;
    	else
    	    return title.substring(0,max-3) + "...";
    }

    /**
    * 제목을 보여줄때 제한된 길이를 초과하면 뒷부분을 짜르고 "..." 으로 대치한다.
    @param title(제목등의 문자열), max(최대길이)
    @return title(변경된 문자열)
    */
    public static String cutZero(String seq) {
        String result = "";

        try {
            result = Integer.parseInt(seq)+"";
        }
        catch(Exception e) {}
        return result;
    }

    /**
	 * Method cropByte. 문자열 바이트수만큼 끊어주고, 생략표시하기
	 * @param str 문자열
	 * @param i 바이트수
	 * @param trail 생략 문자열. 예) "..."
	 * @return String
	 */
	public static String cropByte(String str, int i, String trail) {
    	if (str==null) return "";
    	String tmp = str;
    	int slen = 0, blen = 0;
    	char c;
    	try {
        	if(tmp.getBytes("MS949").length>i) {
        		while (blen+1 < i) {
        			c = tmp.charAt(slen);
        			blen++;
        			slen++;
        			if ( c  > 127 ) blen++;  //2-byte character..
        		}
        		tmp=tmp.substring(0,slen)+trail;
        	}
        } catch(java.io.UnsupportedEncodingException e) {}
    	return tmp;
    }

	/**
     * Method cutUnit. 숫자를 천단위마다 ',' 삽입
     * @param value
     * @return String
     */
    public static String cutUnit( int value )
    {
        DecimalFormat df = new DecimalFormat("###,##0");

        return df.format( value );
    }
    
    /**
     * Method cutUnit. 숫자를 천단위마다 ',' 삽입
     * @param value
     * @return String
     */
    public static String cutUnit( double value )
    {
        DecimalFormat df = new DecimalFormat("###,##0");
        return df.format( value );
    }
    
    /**
     * Method cutUnit. 숫자를 천단위마다 ',' 삽입 
     * 소숫점 존재시 소숫점2자리까지 표기
     * @param value
     * @return String
     */
    public static String cutUnit2( double value )
    {
        DecimalFormat df = new DecimalFormat("###,##0.##");
        return df.format( value );
    }

    public static String cutUnit( String value )
    {
        int val = toInt(value);
        return cutUnit( val );
    }

    /**
     * 문자열의 길이를 반환한다. (한글 2byte, 영문1byte)
     *
     * @param str
     * @return str의 길이
     */
    public static int getStringLength( String str )
    {
        int len = 0;
        try
        {
            len = str.getBytes("MS949").length;
        }
        catch( UnsupportedEncodingException uee )
        {
            uee.printStackTrace();
        }

        return len;
    }

    /**
     * Method showHtml. 태그 보이고, 줄바꿈 문자를 &lt;br> 태그로 변환
     * @param str
     * @return String
     */
    public static String showHtml(String str) {
        if(str==null)
            return "";
        return replace( replace(str, "<", "&lt;"),
                     "\n", "<br>");
    }


    /**
     * Method showHtml. 태그 보이고, 줄바꿈 문자를 &lt;br> 태그로 변환
     * @param str
     * @return String
     */
    public static String showHtml2(String value) {
      if(value !=null && !value.trim().equals(""))
      {

        value = replace(value, "&lt;","<");
        value = replace(value, "&gt;",">");
        value = replace(value, "&#38","&");
      }
      return value;
    }
    /**
     * 통화형으로 변환한다.
     * @param price
     * @return
     */
    public static String priceComma(Object price){        
        
        double ddb = 0.00;
        try{
            ddb = Double.parseDouble(price.toString());
        } catch (Exception e) {
            return "";
        }
        if(ddb == 0.00) return "";
        
        DecimalFormat df = new DecimalFormat(",###.##");
        
        return df.format(ddb);
    }

    /**
     * String을 특정 문자열로 잘라서 String 배열로 넘긴다.
     * @param S
     * @param delim
     * @return
     */
    public static String [] stringSplit(String S,String delim)
    {
        Vector V = new Vector();
        StringSplit SS = new StringSplit(S,delim);
        while(SS.hasMoreTokens())V.addElement(SS.nextToken());
        return vectorToStringArray(V);
    }


    /**
     * String을 특정 문자열로 잘라서 String 배열로 넘긴다.
     * @param V
     * @return
     */
    public static String[] vectorToStringArray(Vector V){
        String [] S = new String[V.size()];
        for(int i=0;i<S.length;i++)S[i]=(String)V.elementAt(i);
        return S;
    }
    
    public static String shieldXSS(String src)
    {
            if (src == null)
                    return "";

            src = replace(src, '\n', "\\n");
            src = replace(src, '\t', "\\t");
            src = replace(src, '\r', "\\r");
            src = replace(src, '\\', "\\\\");
            src = replace(src, '\"', "\\\"");
            src = replace(src, '\'', "\\\'");
            src = replace(src, '>', "\\>");
            src = replace(src, '<', "\\<");
            src = replace(src, ';', "\\;");
            return src;
    }
    
    public static String replace(String src, char chr, String sReplace)
    {
            try {
                    int idx, len = src.length();
                    StringBuffer buffer = new StringBuffer(len);
                    while ((idx = src.indexOf(chr)) != -1)
                    {
                            buffer.append(src.substring(0, idx));
                            buffer.append(sReplace);
                            if (len == idx+1)
                                    break;
                            src = src.substring(idx + 1);
                    }
                    if (len != idx+1)
                            buffer.append(src);

                    return buffer.toString();
            } catch (NullPointerException e) {
                    return null;
            } catch (Exception e) {
                    return null;
            }
    }
    
    /**
     * 텍스트 길이조절
     * @param str      - reSizeString
     * @param divisor  - 제수
     * @param multi    - 곱하기수
     * @param fontsize - defaultSize(Font)
     * @return returnSize(int)
     */
    public static int reSizeFont(String str, int divisor, int multi, int fontsize){
        int returnSize = fontsize;
        int num = 0;
        for( int index=0; index<str.length(); index++ ){
            if( index % divisor == 1 ){
                num++;
            }
        }
        returnSize = returnSize - (multi * num);
        
        return returnSize;
    }
    
    /**
     * 텍스트 길이조절
     * @param str      - reSizeString
     * @param divisor  - 제수
     * @param multi    - 곱하기수
     * @param fontsize - defaultSize(Font)
     * @return returnSize(int)
     */
    public static String getTimeStamp(String str){
    	String timestamp = "";
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
    	Date date = null;
    	str = str.replace("-","");
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
    	long l_ts = date.getTime();
    	timestamp = Long.valueOf(l_ts/1000).toString();
    	return timestamp;
    }
    
	/** UTF 8 규약에 의한 Servlet Engine 간의 차이로 인한 request.getParamter() 의 규약을 피하기 위한 공용 인코딩 메소드
     *  JDK1.4 버전은 다음과 같이 encode(String source, encoding) 을 사용하고,
     *  JDK1.3 버전 이하는 두번째 파라미터인 encoding 옵션이 존재하지 않는다.
     */
	public static String UTFEncode(String strSource) {
		if (strSource == null) return null;
		String encodedStr = null;
		try {encodedStr = URLEncoder.encode(strSource, "utf-8"); } catch (UnsupportedEncodingException uue) {uue.printStackTrace();}
		return encodedStr;
	}

	/** UTF 8 규약에 의한 Servlet Engine 간의 차이로 인한 request.getParamter() 의 규약을 피하기 위한 공용 디코딩 메소드
     *  JDK1.4 버전은 다음과 같이 encode(String source, encoding) 을 사용하고,
     *  JDK1.3 버전 이하는 두번째 파라미터인 encoding 옵션이 존재하지 않는다.
     */
	public static String UTFDecode(String strSource) {
		if (strSource == null)	return null;
		String decodedStr = null;
		try {decodedStr = URLDecoder.decode(strSource, "utf-8");	}	catch (UnsupportedEncodingException uue) {uue.printStackTrace();}
  		return decodedStr;
	}
	
	/**
	 * @param clob				- 치환용 CLOB 타입 글
	 * @return sbf.toString()	- CLOB 변수를 치환하여 return 값
	 */
	/*
	public static String getStringForCLOB(Clob clob) {
		String str = "";
		StringBuffer sbf = new StringBuffer();
		Reader br = null;
		char[] buf = new char[1024];
		int readcnt;
		try {
			if(clob != null){
				br = clob.getCharacterStream(0L);
				while ((readcnt=br.read(buf,0,1024))!=-1) sbf.append(buf,0,readcnt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{if(br!=null)	try {br.close();} catch (IOException e) {	e.printStackTrace();	}}
		return sbf.toString();
	}
	*/
	
	/**
	 * @param clob				- 치환용 CLOB 타입 글
	 * @return sbf.toString()	- CLOB 변수를 치환하여 return 값
	 * @CLOB 타입 변경 oracle.sql.CLOB -> java.sql.Clob
	 */
	public static String getStringForCLOB(Clob clob) throws UnsupportedEncodingException, SQLException{
		String clobValue = "" ;
		
		Reader in = clob.getCharacterStream();
		java.io.Writer sw = new StringWriter();
		char buffer[] = new char[4096];
		int n;
		try {
			while ((n = in.read(buffer)) != -1)
				sw.write(buffer, 0, n);
		} catch (IOException e) {
			// silnoon0 Auto-generated catch block
			e.printStackTrace();
		}
		clobValue = sw.toString();
		
//		int clobCnt = (int)clob.length() ;
//		if (clob != null) {
//			clobValue = clob.getSubString(1, (int)clob.length()) ;
//		} else {
//			clobValue = "" ;
//		}
		
		return clobValue ;	

	}

	
	/** 
     *  @param str=\r\n을 <br /> 치환하기 위한 문자열
     *  @return 치환된 문자열
     */
	public static String getTextAreaVal(String str) {
		String strChng ="";
		if(str != null){
			strChng = str.replace("\r\n", "<br />");
		}
		return strChng;
	}

	/** 
     *  @param str=\r\n을 <br /> 치환하기 위한 문자열
     *  @return 치환된 문자열
     */
	public static String replaceHtml(String str) {
		String strChng ="";
		if(str != null){
			strChng = str.replace("\r\n", "<br />");
			//strChng = strChng.replace(" ", "&nbsp;");			
		}
		return strChng;
	}
	
	/** 
     *  @param List를 입력받아 해당 항목의 요소를 찾아 원하는 한글 / 영문 길이 만큼 잘라서 다시 리턴한다.
     *  @return 치환된 문자열
     */
	public static ArrayList cropByteList(ArrayList list,String strKey,int strLength,String tailer) {	
			Map resultMap = new HashMap();
			
			try {
				if (list == null ) return null;
				for(int i = 0; i < list.size(); i++)
				{
					//System.out.println("Before List =>" + list.get(i));					
					resultMap = (Map)  list.get(i);		
					resultMap.put(strKey, cropByte( (String) resultMap.get(strKey),strLength,tailer) );
					list.set(i, resultMap);
					//System.out.println("Change List =>" + list.get(i));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			resultMap = null;
			return list; 
	  }

	public static String cropHtml(String text) {
		if (text == null ) return null;
		String textWithoutTag = text.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		return textWithoutTag;
	}
	/** 
     *  @param List를 입력받아 Html Tag를 삭제하고 리턴한다.
     *  @return 치환된 문자열
     */
	public static ArrayList cropHtmlList(ArrayList list,String strKey) {	
			Map resultMap = new HashMap();
			
			try {
				if (list == null ) return null;
				for(int i = 0; i < list.size(); i++)
				{
					//System.out.println("Before List =>" + list.get(i));					
					resultMap = (Map)  list.get(i);		
					String text = (String) resultMap.get(strKey);
					if (text != null) {
					   text = text.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");		
					}					
					resultMap.put(strKey, text);
					list.set(i, resultMap);
					//System.out.println("Change List =>" + list.get(i));
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
			resultMap = null;
			return list; 
	  }
	
	 // 임시비밀번호생성
	 public static String shufflePasswd(int len) {	  
		  char[] charSet = new char[]{
		    '0','1','2','3','4','5','6','7','8','9'
		    ,'a','b','c','d','e','f','g','h','i','j','k','l','m'
		    ,'n','o','p','q','r','s','t','u','v','w','x','y','z'};
		  
		  int idx = 0;
		  StringBuffer sb = new StringBuffer();
		  for(int i=0; i<len; i++){
		   idx = (int)(charSet.length*Math.random());
		   sb.append(charSet[idx]);
		  }		  
		  return sb.toString();
	 }
	 
	 
	 
	 /*
	  * 특수문자 입력에 대한 검색 값 진입시 변경 처리
	  * 
	  */
	 public static String sslTypeCharChange(String src) {
		src = replace( src,	'<'	,	"&lt;" );
		src = replace( src,	'>'	,	"&gt;" );
		src = replace( src,	'('	,	"&#40" );
		src = replace( src,	')'	,	"&#41" );
		src = replace( src,	'#'	,	"&#35" );
		src = replace( src,	'&'	,	"&#38" );
		src = replace( src,	'.'	,	"&#39" );
		src = replace( src, '"'	,	"&#34" );
		src = replace( src, '/'	,	"&#47" );
		src = replace( src, '\\',	"&#92" );
		src = replace( src, ':'	,	"&#59" );
		src = replace( src, '\n',	"&#10" );	//LF(Line Feed)
		src = replace( src, '\r',	"&#13" );	//CR(Carriage Return)
		return src;
	}
	 
	 public static String sslTypeCharChangeRevert(String src) {
		 src = replace( src,	"&lt;"	,	"<" );
		 src = replace( src,	"&gt;"	,	">" );
		 src = replace( src,	"&#40;"	,	"(" );
		 src = replace( src,	"&#41;"	,	")" );
		 src = replace( src,	"&#35;"	,	"#" );
		 src = replace( src,	"&#38;"	,	"&" );
		 src = replace( src,	"&#39;"	,	"." );
		 src = replace( src, 	"&#34;"	,	"'" );
		 src = replace( src, 	"&#47;"	,	"/" );
		 src = replace( src, 	"&#92;"	,	"\\\\" );
		 src = replace( src, 	"&#59;"	,	":" );
		 src = replace( src, 	"&#10;"	,	"\\n" );	//LF(Line Feed)
		 src = replace( src, 	"&#13;"	,	"\\r" );	//CR(Carriage Return)
		 return src;
	}
	 
	 
    /**
     * Map NullPoint 예외처리
     * @param hashMap
     * @param str
     * @return
     */
    public static String mapValue(Map map, String str){
        return mapValue(map, str, "");
    }
    public static String mapValue(Map map, String str, String next){
        
        String returnVal = "";
    
    if (map.get(str)==null){ //빈값이면 
        return next;
    }else {//값이 있으면
        returnVal = map.get(str).toString();
        returnVal = returnVal.trim(); 
       if  (returnVal.equals("")){
       returnVal = next;//빈값이면 할당할 값
           }
        }
    
        return returnVal;
    }
    
    
    /**
     * 해쉬맵을 담은 리스트를 가지고 체크 검사
     * @param list
     * @param next_gubun
     * @param str
     * @return
     */
    public static boolean listMap_indexOf_menu(List list,String next_gubun, String str){
        
        boolean returnVal = false;
   
        if(null != list && list.size() > 0){
            for(int i=0; i<list.size(); i++){
                HashMap map = (HashMap)list.get(i);
                if(StringManager.hashMapValue(map, next_gubun).equals(str)){
                    returnVal = true;
                    break;
                }
            }
        }                       
        return returnVal;
    }
    
    
    /**
     * HashMap NullPoint 예외처리
     * @param hashMap
     * @param str
     * @return
     */
    public static String hashMapValue(HashMap hashMap, String str){
        return hashMapValue(hashMap, str, "");
    }
    public static String hashMapValue(HashMap hashMap, String str, String next){
        
        String returnVal = "";
    
    if (hashMap.get(str)==null){ //빈값이면 
        return next;
    }else {//값이 있으면
        returnVal = hashMap.get(str).toString();
        returnVal = returnVal.trim(); 
       if  (returnVal.equals("")){
       returnVal = next;//빈값이면 할당할 값
           }
        }
    
        return returnVal;
    }
    
    public static String phoneFormatPrivacy(Object obj){
        return phoneFormatPrivacy(obj.toString());
    }
    
    /**
     * 전화번호 포맷 설정
     * @param phoneNo
     * @return
     */
    public static String phoneFormatPrivacy(String phoneNo){
     
      if (phoneNo.length() == 0){
       return phoneNo;
         }
      
         String strTel = phoneNo;
         String[] strDDD = {"02" , "031", "032", "033", "041", "042", "043",
                              "051", "052", "053", "054", "055", "061", "062",
                              "063", "064", "010", "011", "012", "013", "015",
                              "016", "017", "018", "019", "070"};
         
         strTel=strTel.replaceAll("-", "");
         if (strTel.length() < 9) {
             return strTel;
         } else if (strTel.substring(0,2).equals(strDDD[0])) {
             strTel = strTel.substring(0,2) + '-' + strTel.substring(2, strTel.length()-4)
                  + "-****";
         } else {
             for(int i=1; i < strDDD.length; i++) {
                 if (strTel.substring(0,3).equals(strDDD[i])) {
                     strTel = strTel.substring(0,3) + '-' + strTel.substring(3, strTel.length()-4)
                      +"-****";
                 }
             }
         }
         return strTel;
    }
    
    public static String phoneFormatPrivacyMid(Object obj){
        return phoneFormatPrivacy(obj.toString());
    }
    
    /**
     * 전화번호 포맷 설정
     * @param phoneNo
     * @return
     */
    public static String phoneFormatPrivacyMid(String phoneNo){
     
       if (phoneNo.length() == 0){
           return phoneNo;
       }
      
       String strTel = phoneNo;
       String [] tmp = phoneNo.split("\\-");
         
       if (strTel.length() < 9) {
           return strTel;
       } else {
           strTel = new StringBuffer(tmp[0]).append("-").append("****")
           .append("-").append(tmp[2]).toString();
       }
         
       return strTel;
    }
    
    /**
	 * <p>문자열을 원하는수 만큼 짜르고 ...을 붙여준다.</p>
	 * 	@param str 짜를문자열
	 * @param f_size 짜를 숫자
	 */
	public static String cutStr(String str,int f_size) throws Exception {
		return cutStr(str,f_size,"...");
	}
	
	/**
	 * <p>문자열을 원하는수 만큼 짜르고 원하는문자를 마지막에 붙여준다.</p>
	 * @param str 짜를문자열
	 * @param f_size 짜를 숫자
	 * @param joinStr 마지막에 붙일 문장 보통 ...
	 */
	public static String cutStr(String str,int f_size,String joinStr) throws Exception {
		
		if(str.equals("") || str.getBytes().length <= f_size){
			return str;
		}
		
		String a = str;
		int i = 0;
		String temp = "";
		String rtn_val = "";
		temp = a.substring(0,1);
		while(i < f_size){
		    byte[] ar = temp.getBytes();
		
		    i += ar.length;
		
		    rtn_val += temp;
		    a = a.substring(1);
		    if(a.length() == 1){
		       temp = a;
		    }else if(a.length() > 1){
		       temp = a.substring(0,1);
		    }
		}
		
		return rtn_val+joinStr;
	}
	
	@SuppressWarnings("unchecked")
	public static JSONObject getJsonStringFromMap( Map<String, Object> map ) {

		JSONObject json = new JSONObject();
		for( Map.Entry<String, Object> entry : map.entrySet() ) {
			String key = entry.getKey();
			Object value = entry.getValue();
			json.put(key, value);
		}
		
		return json;
	}
	
	/**
	 * String 을 전화번호 문자열로 반환
	 * @param str 변환할 문자열
	 */
	public static String formatPhonenumber(String src) {
		if (src == null) {
			return "";
		}
		if (src.length() == 8) {
			return src.replaceFirst("^([0-9]{4})([0-9]{4})$", "$1-$2");
		} else if (src.length() == 12) {
			return src.replaceFirst("(^[0-9]{4})([0-9]{4})([0-9]{4})$", "$1-$2-$3");
		}
		return src.replaceFirst("(^02|[0-9]{3})([0-9]{3,4})([0-9]{4})$", "$1-$2-$3");
	}
	


}


