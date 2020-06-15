package com.dchem.action.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;

import com.dchem.util.BaseAction;
import com.dchem.util.SessionProcess;
import com.dchem.util.StringManager;

import net.sf.jazzlib.ZipEntry;
import net.sf.jazzlib.ZipOutputStream;

public class CommonAction extends BaseAction {
	static Logger logger = Logger.getLogger(CommonAction.class);

	private static final long serialVersionUID = 1L;
	
	private InputStream inputStream;

	HashMap<String, Object> paramMap = new HashMap<String, Object>();
	HashMap<String, Object> resultMap = new HashMap<String, Object>();
	
	private String img_path;
	private String CKEditorFuncNum;

	/**
	 * 관리자 메인
	 * @return
	 * @throws Exception
	 */
	public String main() throws Exception {
	    
        //로그인 체크
        String _authCheck = commonLoginCheck(); 
        if(!"".equals(_authCheck)){
            return _authCheck;
        }
	    
	    return SUCCESS;
	}
	
	public String logout() throws Exception {
	    
	    SessionProcess sp = new SessionProcess();
	    sp.setSession();
	    
	    resultMap.put("message", "로그아웃 되었습니다.");
	    resultMap.put("nextURL", "/admin/login/loginView.do");
	    
	    return "redirect";
	}
	
	/* 다운로드 */
    private String dir = "";
    private String l_file;
    private String p_file;
    private int oder_file;
    private String idx;
    private String contentDisposition;
    private long contentLength;
    
    public String userDownLoad () throws Exception{
        try{

            if ( dir != null && !"".equals(dir) ) {
                dir = strReplace(dir , "\\");
                dir = strReplace(dir , "&");
                dir = strReplace(dir , "//");
                dir = strReplace(dir , "..");
            }

            if ( p_file != null && !"".equals(p_file) ) {
                p_file = strReplace(p_file , "\\");
                p_file = strReplace(p_file , "&");
                p_file = strReplace(p_file , "//");
            }

            String down_file = new StringBuffer(IMG_DOWNPATH).append("/").append(dir).append("/").append(p_file).toString();
            
            System.out.println(down_file);

            File fileInfo = new File(down_file);
            if(!fileInfo.exists()){
                message = "잘못된 파일입니다. 다시 확인하시기 바랍니다.";
                nextURL = "close";
                target = SITE_DOMAIN;
                
                resultMap.put("message", message);
                resultMap.put("nextURL", nextURL);
                resultMap.put("target", target);
                
                return "redirect";
            }
            setContentLength(fileInfo.length());

            // 로컬에서는 ISO-8859-1 서버는 UTF-8
            l_file = URLEncoder.encode(l_file, "UTF-8");
            l_file = l_file.replaceAll("\\+", "%20"); // 한글 파일명 공백처리
            
            //setContentDisposition("attachment;filename="+ URLEncoder.encode(l_file, "UTF-8"));
            setContentDisposition("attachment;filename="+ l_file);
            setInputStream(new FileInputStream(down_file));

        }catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
    
    @SuppressWarnings("unchecked")
	public String userFileDownLoad() throws Exception{
        
    	try{

            if ( dir != null && !"".equals(dir) ) {
                dir = strReplace(dir , "\\");
                dir = strReplace(dir , "&");
                dir = strReplace(dir , "//");
                dir = strReplace(dir , "..");
            }

            if ( p_file != null && !"".equals(p_file) ) {
                p_file = strReplace(p_file , "\\");
                p_file = strReplace(p_file , "&");
                p_file = strReplace(p_file , "//");
            }

            String down_file = new StringBuffer(IMG_DOWNPATH).append("/").append(dir).append("/").append(p_file).toString();
            
            System.out.println(down_file);

            File fileInfo = new File(down_file);
            if(!fileInfo.exists()){
                message = "잘못된 파일입니다. 다시 확인하시기 바랍니다.";
                nextURL = "close";
                target = SITE_DOMAIN;
                
                resultMap.put("message", message);
                resultMap.put("nextURL", nextURL);
                resultMap.put("target", target);
                
                return "redirect";
            }
            setContentLength(fileInfo.length());
            
            HashMap<String, Object> param = new HashMap<String, Object>();
            param.put("NO_ATCH_FILE_SRAL", idx);
            param.put("NM_PHYS_FILE", p_file);
            HashMap<String, Object> fileMap = (HashMap<String, Object>) sqlMap
            		.queryForObject("adminCommonMapper.selectFileByPk", param);
            
            if (fileMap != null) {
            	l_file = (String) fileMap.get("NM_LOGI_FILE");
            }

            // 로컬에서는 ISO-8859-1 서버는 UTF-8
            l_file = StringManager.sslTypeCharChangeRevert(l_file);
            //System.out.println("===========> " + l_file);

            //l_file = URLEncoder.encode(l_file, "UTF-8");
            //System.out.println("===========> " + l_file);
            // l_file = l_file.replaceAll("\\+", "%20"); // 한글 파일명 공백처리
            //System.out.println("===========> " + l_file);
            
            //setContentDisposition("attachment;filename="+ URLEncoder.encode(l_file, "UTF-8"));
            //System.out.println(getDisposition(l_file, getBrowser(request)));
            //System.out.println(getBrowser(request));
            String desposition = getDisposition(l_file, getBrowser(request));
            setContentDisposition(desposition);
            //setContentDisposition("attachment;filename="+ l_file);
            setInputStream(new FileInputStream(down_file));

        }catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
    
    public String userAllDownLoad () throws Exception{
    	byte[] buf = new byte[4096];
    	
        try{

            if ( dir != null && !"".equals(dir) ) {
                dir = strReplace(dir , "\\");
                dir = strReplace(dir , "&");
                dir = strReplace(dir , "//");
                dir = strReplace(dir , "..");
            }

            if ( p_file != null && !"".equals(p_file) ) {
                p_file = strReplace(p_file , "\\");
                p_file = strReplace(p_file , "&");
                p_file = strReplace(p_file , "//");
            }
            
            
            HashMap<String, Object> param = new HashMap<String, Object>();
            param.put("NO_ATCH_FILE_SRAL", idx);
            param.put("ODER_MKAR", oder_file);
            
            // 압축 대상 파일 : 전체 ODER_MKAR 다음의 파일들
            ArrayList uploadFileList = (ArrayList) sqlMap.queryForList("adminCommonMapper.selectFilesByOder", param);
            
            if(uploadFileList != null && uploadFileList.size() > 0){
            	 String zipFileName = new StringBuffer(IMG_DOWNPATH).append("/tmp/").append(p_file).append(".zip").toString();
                 
                 // 기존 파일 있을 경우 삭제
                 File zipFile = new File(zipFileName);
     			if (zipFile.exists()) {
     				zipFile.delete();
     			}
                 
                 ZipOutputStream out = new ZipOutputStream(new FileOutputStream(zipFileName));

                 for(int i=0;i < uploadFileList.size();i++){
                 	Map fileMap = (Map) uploadFileList.get(i);
                 	
                 	String PTH_FILE_PHYS = (String) fileMap.get("PTH_FILE_PHYS");
                 	String NM_PHYS_FILE = (String) fileMap.get("NM_PHYS_FILE");
                 	String NM_LOGI_FILE = (String) fileMap.get("NM_LOGI_FILE");
                 	
                 	File fileOri = new File(new StringBuffer(PTH_FILE_PHYS).append(NM_PHYS_FILE).toString());
                 	FileInputStream in = new FileInputStream(fileOri);
                     
                 	NM_LOGI_FILE = StringManager.sslTypeCharChangeRevert(NM_LOGI_FILE);
                 	
                 	System.out.println("NM_LOGI_FILE : "+NM_LOGI_FILE);
                 	
                     ZipEntry ze = new ZipEntry( NM_LOGI_FILE );
                     out.putNextEntry(ze);
                     
                     int len;
                     while ((len = in.read(buf)) > 0) {
                         out.write(buf, 0, len);
                     }
             	      
                     out.closeEntry();
                     in.close();

                 }
             	      
                 out.close();
                 
                 System.out.println(zipFileName);

                 File fileInfo = new File(zipFileName);
                 if(!fileInfo.exists()){
                     message = "잘못된 파일입니다. 다시 확인하시기 바랍니다.";
                     nextURL = "go-1";
                     //target = SITE_DOMAIN;
                     
                     resultMap.put("message", message);
                     resultMap.put("nextURL", nextURL);
                     
                     return "redirect";
                 }
                 setContentLength(fileInfo.length());

                 // 로컬에서는 ISO-8859-1 서버는 UTF-8
                 p_file = URLEncoder.encode(p_file, "UTF-8");
                 p_file = p_file.replaceAll("\\+", "%20"); // 한글 파일명 공백처리
                 
                 setContentDisposition("attachment;filename="+ p_file + ".zip");
                 setInputStream(new FileInputStream(zipFileName));
            }else{
            	
            	 message = "잘못된 파일입니다. 다시 확인하시기 바랍니다.";
                 nextURL = "go-1";
                 //target = SITE_DOMAIN;
                 
                 resultMap.put("message", message);
                 resultMap.put("nextURL", nextURL);
                 
                 return "redirect";
            }
            
        }catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
    
    @SuppressWarnings("unused")
	private String getBrowser(HttpServletRequest request) {
        String header = request.getHeader("User-Agent");
        if (header.indexOf("MSIE") > -1) {
            return "MSIE";
        } else if (header.indexOf("Chrome") > -1) {
            return "Chrome";
        } else if (header.indexOf("Opera") > -1) {
            return "Opera";
        } else {
        	//return "Firefox";
        	return "MSIE";
        }
    }
    
    @SuppressWarnings("unused")
	private String getDisposition(String filename, String browser)
            throws Exception {
		String dispositionPrefix = "attachment;filename=";
		String encodedFilename = null;
		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}	
			}
			encodedFilename = sb.toString();
		} else {
			throw new RuntimeException("Not supported browser");
		}
		return dispositionPrefix + encodedFilename;
	}
    
    
    
    public String editorUpload() throws Exception{
		paramMap = getMap();

		//업로드 수행
		HashMap files = editorUpload((String) paramMap.get("type"));
		if(uploadcheck){
			return "commonMsg";
		}

		setImg_path("/upload/"+paramMap.get("type")+"/"+files.get("NM_PHYS_FILE"));
		setCKEditorFuncNum((String) paramMap.get("CKEditorFuncNum"));
		return "success";
	}
	
	public HashMap<String, Object> getResultMap() {
		return resultMap;
	}

	public void setResultMap(HashMap<String, Object> resultMap) {
		this.resultMap = resultMap;
	}

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }
	
    public String getContentDisposition() {
        return contentDisposition;
    }

    public void setContentDisposition(String contentDisposition) {
        this.contentDisposition = contentDisposition;
    }

    public long getContentLength() {
        return contentLength;
    }

    public void setContentLength(long contentLength) {
        this.contentLength = contentLength;
    }

    public String getDir() {
        return dir;
    }

    public void setDir(String dir) {
        this.dir = dir;
    }

    public String getL_file() {
        return l_file;
    }

    public void setL_file(String l_file) {
        this.l_file = l_file;
    }

    public String getP_file() {
        return p_file;
    }

    public void setP_file(String p_file) {
        this.p_file = p_file;
    }

	public HashMap<String, Object> getParamMap() {
		return paramMap;
	}

	public void setParamMap(HashMap<String, Object> paramMap) {
		this.paramMap = paramMap;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public String getCKEditorFuncNum() {
		return CKEditorFuncNum;
	}

	public void setCKEditorFuncNum(String cKEditorFuncNum) {
		CKEditorFuncNum = cKEditorFuncNum;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public int getOder_file() {
		return oder_file;
	}

	public void setOder_file(int oder_file) {
		this.oder_file = oder_file;
	}

    
}
