package com.fnc.util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.fnc.common.vo.AdminVo;
import com.fnc.util.SqlReaderXml;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements ServletRequestAware, ServletResponseAware, SessionAware {

	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(BaseAction.class);
	protected static final String ADMIN_INFO = "adminVo";

	protected SqlMapClient sqlMap = null;

	protected Map<String, Object> session;
	protected AdminVo adminVo;
	protected HttpServletRequest request;
	protected HttpServletResponse response;

	public AdminVo getAdminVo() {
		return adminVo;
	}

	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadsFileName = new ArrayList<String>();
	private List<String> uploadsContentType = new ArrayList<String>();

	private List<File> uploadsThum = new ArrayList<File>();
    private List<String> uploadsThumFileName = new ArrayList<String>();
    private List<String> uploadsThumContentType = new ArrayList<String>();

	protected InputStream inputStream;

	public String aprhRequestUri = ""; //접근 Action URI
	public List listAuth = null;

	/* 에러 관련 공통 변수 추가 */
    public String message;
    public String nextURL;
    public String target;
    public boolean uploadFilecheck = false;

	public BaseAction() {
		super();
		ActionContext context = ActionContext.getContext();
		session = (Map<String, Object>)context.getSession();
		adminVo = (AdminVo)session.get(ADMIN_INFO);

		try {
			sqlMap = SqlReaderXml.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				sqlMap.getCurrentConnection().rollback();
				sqlMap.endTransaction();

			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {

		}
	}

	public static String getConfig(String argc){
		String rtn = "";
		rtn = ResourceBundle.getBundle("config").getString(argc);
		return rtn;
	}

	public static final String IMG_DOWNPATH            = getConfig("resource.file.download.path");       //이미지 업로드 Temp 경로
	public static final String SITE_DOMAIN             = getConfig("resource.domain");

	public static String cleanXSS(String value) {
    	//value = value.replaceAll("<", "& lt;").replaceAll(">", "& gt;");
		value = value.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
		value = value.replaceAll("'", "&#39;");
		value = value.replaceAll("eval\\((.*)\\)", "");
		value = value.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
		value = value.replaceAll("script", "");
		return value;
	}
    private String[] cleanXSSArr(String[] value) {
    	for(int i=0;i<value.length;i++){
    		value[i] = cleanXSS(value[i]);
    	}
    	return value;
	}

	/**
	 * 모든 파라미터를 HashMap에 담는다.
	 *
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	protected HashMap<String, Object> getMap() throws Exception {
		Enumeration e1 = request.getParameterNames();
		HashMap<String, Object> parMap = new HashMap<String, Object>();
		while (e1.hasMoreElements()) {
			String key = (String) e1.nextElement();
			parMap.put(key, cleanXSS(request.getParameter(key)));
		}
		e1 = null;
		request.setAttribute("paramMap", parMap);
		return parMap;
	}

	/**
	 * 모든 다중 파라미터를 HashMap에 담는다.
	 *
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	protected HashMap<String, String[]> getMaps() throws Exception {
		Enumeration e1 = request.getParameterNames();
		HashMap<String, String[]> parMap = new HashMap<String, String[]>();
		while (e1.hasMoreElements()) {
			String key = (String) e1.nextElement();
			parMap.put(key, cleanXSSArr(request.getParameterValues(key)));
		}
		e1 = null;
		request.setAttribute("paramMaps", parMap);
		return parMap;
	}

	/**
	 * 모든 첨부파일을 저장소에 복사한 후 관련정보를 HashMap에 담는다.
	 * @return
	 * @throws Exception
	 */
	protected List<HashMap<String, String>> getImageMaps() throws Exception {
		List<HashMap<String, String>> reqList = new ArrayList<HashMap<String, String>>();
		String filePath = request.getSession().getServletContext().getRealPath("/") + getConfig("resource.community.upload.folder");

		for (int i = 0; i < uploads.size(); i++) {
			HashMap<String, String> tmpMap = new HashMap<String, String>();
			if(getUploads().get(i) == null){

			}else{
				String fileName = getUploadsFileName().get(i);

				// 확장자 체크 로직
				if(!checkFilExt(fileName)){
					message = "잘못된 첨부파일입니다. 다시 확인하시기 바랍니다.";
                    nextURL = "history.back";
                    uploadFilecheck = true;
                    return reqList;
				}

				String ext = fileName.substring(fileName.lastIndexOf("."));
				String chgFileName = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new Date());
				chgFileName = today+RandomStringUtils.randomAlphanumeric(5) + ext;
//				new File(filePath).mkdirs();
				File destFile = new File(filePath + chgFileName);
				FileUtils.copyFile(getUploads().get(i), destFile);

				//경로는 서버 세팅 이후에 따로 지정 필요
				tmpMap.put("nmFileOrgl", cleanXSS(fileName));
				tmpMap.put("nmFileChg", cleanXSS(chgFileName));
				tmpMap.put("pthFilePhys", getConfig("resource.context"));
                tmpMap.put("pthFileLogi", getConfig("resource.thumbnail.upload.folder"));
                tmpMap.put("pthFileLogiCmnty", getConfig("resource.community.upload.folder"));
				tmpMap.put("notmDwld", "0");
				tmpMap.put("nmTyFile", cleanXSS(ext.replace(".", "")));
				tmpMap.put("sizeFile", String.valueOf(getUploads().get(i).length()));
			}
			reqList.add(tmpMap);
		}
		return reqList;
	}

	/**
     * 모든 첨부파일을 저장소에 복사한 후 관련정보를 HashMap에 담는다.
     * @return
     * @throws Exception
     */
    protected List<HashMap<String, String>> getImageThumMaps() throws Exception {
        List<HashMap<String, String>> reqList = new ArrayList<HashMap<String, String>>();
        String filePath = request.getSession().getServletContext().getRealPath("/") + getConfig("resource.thumbnail.upload.folder");

        for (int i = 0; i < uploadsThum.size(); i++) {
        	HashMap<String, String> tmpMap = new HashMap<String, String>();
            if(getUploadsThum().get(i) == null){

            }else{
                String fileName = getUploadsThumFileName().get(i);
                String ext = fileName.substring(fileName.lastIndexOf("."));
                String chgFileName = "";
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String today= formatter.format(new Date());
                chgFileName = today+RandomStringUtils.randomAlphanumeric(5) + ext;
                File destFile = new File(filePath + chgFileName);
                FileUtils.copyFile(getUploadsThum().get(i), destFile);

                if(ext.toLowerCase().indexOf("jsp") > -1 ||
                        ext.toLowerCase().indexOf("asp") > -1 ||
                        ext.toLowerCase().indexOf("php") > -1 ||
                        ext.toLowerCase().indexOf("exe") > -1 ||
                        ext.toLowerCase().indexOf("com") > -1 ||
                        ext.toLowerCase().indexOf("bat") > -1 ||
                        ext.toLowerCase().indexOf("sh") > -1 ||
                        ext.toLowerCase().indexOf("js") > -1 ||
                        ext.toLowerCase().indexOf("dll") > -1 ||
                        ext.toLowerCase().indexOf("ocx") > -1){

                    message = "잘못된 첨부파일입니다. 다시 확인하시기 바랍니다.";
                    nextURL = "history.back";
                    uploadFilecheck = true;
                    return reqList;
                }

                //경로는 서버 세팅 이후에 따로 지정 필요
                tmpMap.put("nmFileOrgl", cleanXSS(fileName));
                tmpMap.put("nmFileChg", cleanXSS(chgFileName));
                tmpMap.put("pthFilePhys", getConfig("resource.context"));
                tmpMap.put("pthFileLogi", getConfig("resource.thumbnail.upload.folder"));
                tmpMap.put("notmDwld", "0");
                tmpMap.put("nmTyFile", cleanXSS(ext.replace(".", "")));
                tmpMap.put("sizeFile", String.valueOf(getUploadsThum().get(i).length()));
            }
            reqList.add(tmpMap);
        }
        return reqList;
    }

	protected List<HashMap<String, String>> getProductFiles() throws Exception {
		List<HashMap<String, String>> reqList = new ArrayList<HashMap<String, String>>();
		String filePath = request.getSession().getServletContext().getRealPath("/") + getConfig("resource.product.upload.folder");

		for (int i = 0; i < uploads.size(); i++) {
			HashMap<String, String> tmpMap = new HashMap<String, String>();
			if(getUploads().get(i) == null){

			}else{
				String fileName = getUploadsFileName().get(i);

				// 확장자 체크 로직
				if(!checkFilExt(fileName)){
					message = "잘못된 첨부파일입니다. 다시 확인하시기 바랍니다.";
                    nextURL = "history.back";
                    uploadFilecheck = true;
                    return reqList;
				}

				String ext = fileName.substring(fileName.lastIndexOf("."));
				String chgFileName = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new Date());
				chgFileName = today+RandomStringUtils.randomAlphanumeric(5) + ext;
				File destFile = new File(filePath + chgFileName);
				FileUtils.copyFile(getUploads().get(i), destFile);

				//경로는 서버 세팅 이후에 따로 지정 필요
				tmpMap.put("nmFileOrgl", cleanXSS(fileName));
				tmpMap.put("nmFileChg", cleanXSS(chgFileName));
				tmpMap.put("pthFilePhys", getConfig("resource.context"));
                tmpMap.put("pthFileLogi", getConfig("resource.product.upload.folder"));
				tmpMap.put("notmDwld", "0");
				tmpMap.put("nmTyFile", cleanXSS(ext.replace(".", "")));
				tmpMap.put("sizeFile", String.valueOf(getUploads().get(i).length()));
			}
			reqList.add(tmpMap);
		}
		return reqList;
	}

	protected List<HashMap<String, String>> getSinmungoFiles() throws Exception {
		List<HashMap<String, String>> reqList = new ArrayList<HashMap<String, String>>();
		String filePath = request.getSession().getServletContext().getRealPath("/") + getConfig("resource.sinmungo.upload.folder");

		for (int i = 0; i < uploads.size(); i++) {
			HashMap<String, String> tmpMap = new HashMap<String, String>();
			if(getUploads().get(i) == null){

			}else{
				String fileName = getUploadsFileName().get(i);

				// 확장자 체크 로직
				if(!checkFilExt(fileName)){
					message = "잘못된 첨부파일입니다. 다시 확인하시기 바랍니다.";
                    nextURL = "history.back";
                    uploadFilecheck = true;
                    return reqList;
				}

				String ext = fileName.substring(fileName.lastIndexOf("."));
				String chgFileName = "";
				SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
				String today= formatter.format(new Date());
				chgFileName = today+RandomStringUtils.randomAlphanumeric(5) + ext;
				File destFile = new File(filePath + chgFileName);
				FileUtils.copyFile(getUploads().get(i), destFile);

				//경로는 서버 세팅 이후에 따로 지정 필요
				tmpMap.put("nmFileOrgl", cleanXSS(fileName));
				tmpMap.put("nmFileChg", cleanXSS(chgFileName));
				tmpMap.put("pthFilePhys", getConfig("resource.context"));
                tmpMap.put("pthFileLogi", getConfig("resource.sinmungo.upload.folder"));
				tmpMap.put("notmDwld", "0");
				tmpMap.put("nmTyFile", cleanXSS(ext.replace(".", "")));
				tmpMap.put("sizeFile", String.valueOf(getUploads().get(i).length()));
			}
			reqList.add(tmpMap);
		}
		return reqList;
	}

	/**
	 * ajax 통신 마지막 부분 리턴
	 * @return
	 * @throws Exception
	 */
	public void ajaxEnd(String error, String message){

		response.setContentType("application/xml");
        response.setCharacterEncoding("utf-8");

        String data = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
                + "<response>"
                + "<error>" + error + "</error>"
                + "<message>" + message + "</message>"
                + "</response>";
        try {
        	PrintWriter out = response.getWriter();
        	out.print(data);
            out.flush();
            out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 관리자 로그인 체크
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	protected String commonLoginCheck() throws Exception {
	    SessionProcess sp = new SessionProcess();
        Map<String, Object> loginInfo = sp.getSession();
        String ADMIN_LOGIN = StringManager.mapValue(loginInfo, "ADMIN_LOGIN");

        if("true".equals(ADMIN_LOGIN)){
            return "";
        } else {
            return "adminLogin";
        }
	}

	/**
     * 관리자 권한및 로그인 체크
     * @param check
     * @return
     * @throws Exception
     */
    @SuppressWarnings("rawtypes")
	protected String commonAdminAuth(String code) throws Exception {
        SessionProcess sp = new SessionProcess();
        Map loginInfo = sp.getSession();
        String ADMIN_LOGIN = StringManager.mapValue(loginInfo, "ADMIN_LOGIN");
        request = ServletActionContext.getRequest();

        //접근페이지 URL저장
        aprhRequestUri = request.getRequestURI();
        HttpSession session = ServletActionContext.getRequest().getSession();
        session.setAttribute("_ADMIN_APRH_URL", aprhRequestUri);

        if("true".equals(ADMIN_LOGIN)){

            listAuth = (List)loginInfo.get("ATRT_ADMN_PRSN");

            if(!StringManager.listMap_indexOf_menu(listAuth,"CD_MNU",code)){

                session.setAttribute("_ADMIN_RETURN_URL_","");
                return "noAuth";
            }else{
                return "";
            }

        }else{
            request = ServletActionContext.getRequest();

            String requestUrl = request.getRequestURL().toString();
            String _REQUEST_PARAM = "";
            Map m$ = request.getParameterMap();
            Iterator i$ = m$.entrySet().iterator();
            while(i$.hasNext()){
                java.util.Map.Entry entry$ = (java.util.Map.Entry) i$.next();
                Object key$ = entry$.getKey();
                String[] value$ = (String[])m$.get(key$);

                for(int j$=0;j$<value$.length;j$++){
                    if("".equals(_REQUEST_PARAM)){
                        if(!"".equals(value$[j$])) _REQUEST_PARAM = "?"+key$+"="+value$[j$];
                    }else{
                        if(!"".equals(value$[j$])) _REQUEST_PARAM += "&"+key$+"="+value$[j$];
                    }
                }
            }

            requestUrl = requestUrl +_REQUEST_PARAM;
            session.setAttribute("_ADMIN_RETURN_URL_", requestUrl);
            return "adminLogin";
        }
    }

    /**
     * IP 조회
     * @return
     */
    public static String getClientIP() {
        HttpServletRequest request = ServletActionContext.getRequest();
        String ip = request.getHeader("X-Forwarded-For");

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        return ip;
    }

	public Map<String, Object> getSession(){
		if ( session == null ) {
			ActionContext context = ActionContext.getContext();
			session = (Map<String, Object>) context.getSession();
		}

		return (Map<String, Object>) session;
	}

	public void doSession(Map<String, Object> session){
		ActionContext context = ActionContext.getContext();
		context.setSession(session);
	}

    /**
     * 불필요한 문자열 치환
     * @param s1
     * @param s2
     * @return
     */
    public static String strReplace(String s1, String s2){
        String res = "";
        StringTokenizer str = new StringTokenizer(s1, s2);

        while(str.hasMoreTokens()){
            res += str.nextToken();
        }
        return res;
    }

    /**
     * 접근 로그 - Not Commit
     * @param tmpMap
     * @throws Exception
     */
    @SuppressWarnings("unchecked")
	public void insertAprhResn(HashMap<String, Object> tmpMap) throws Exception {

        SessionProcess sp = new SessionProcess();
        Map<String, Object> loginInfo = sp.getSession();

        tmpMap.put("ID_ADMN_PRSN"   , StringManager.mapValue(loginInfo, "ID_ADMN_PRSN"));
        tmpMap.put("IP_ADMN_PRSN"   , getClientIP());

        sqlMap.insert("adminCommonMapper.insertAprhResn" , tmpMap);
    }

    /**
     * 접근 로그 - Commit
     * @return
     */
    public void insertAprhResnCommit(HashMap<String, Object> tmpMap) throws Exception {
        try{
            sqlMap.startTransaction();
            insertAprhResn(tmpMap);
            sqlMap.commitTransaction();
        }catch(Exception e){
            e.printStackTrace();
            sqlMap.getCurrentConnection().rollback();
        }finally{
            sqlMap.endTransaction();
        }
    }

    /* 업로드 */
	public String upload;
	public String uploadContentType;
	public String uploadFileName;
	public boolean uploadcheck = false;

	public HashMap<String, Object> editorUpload(String dir) throws Exception {

		HashMap<String, Object> fileMap = new HashMap<String, Object>();

		String filePath = getConfig("resource.file.upload.folder");
		int fileMaxSize = Integer.parseInt(getConfig("resource.file.upload.maxSize"));

		if(upload != null){

			/* 1. 첨부파일 제한 체크 */
			if(uploadContentType.indexOf("application") > -1 ){
				//errMsg = "잘못된 첨부파일입니다. 다시 확인하시기 바랍니다.";
				//url = "history.back";
				uploadcheck = true;
				return fileMap;
			}

			if(uploadFileName.toLowerCase().indexOf(".jsp") > -1 ||
					uploadContentType.toLowerCase().indexOf(".asp") > -1 ||
					uploadContentType.toLowerCase().indexOf(".php") > -1 ||
					uploadContentType.toLowerCase().indexOf(".exe") > -1 ||
					uploadContentType.toLowerCase().indexOf(".com") > -1 ||
					uploadContentType.toLowerCase().indexOf(".bat") > -1 ||
					uploadContentType.toLowerCase().indexOf(".sh") > -1 ||
					uploadContentType.toLowerCase().indexOf(".js") > -1 ||
					uploadContentType.toLowerCase().indexOf(".dll") > -1 ||
					uploadContentType.toLowerCase().indexOf(".ocx") > -1){

				//errMsg = "잘못된 첨부파일입니다. 다시 확인하시기 바랍니다.";
				//url = "history.back";
				uploadcheck = true;
				return fileMap;
			}

			/* 2. 파일 사이즈 체크 */
			File temFile = new File(upload);
			int fileSize = (int) temFile.length();

			if(fileMaxSize < fileSize ){

				//errMsg = "첨부파일은 최대 10MB까지 가능합니다.";
				//url = "history.back";
				uploadcheck = true;
				return fileMap;
			}

			if(!uploadcheck){

				/* 3. tmp폴더로 파일 생성 */
				File tmpFile;
				File dirYn;
				File uploadFile;
				uploadFile = new File(upload);
				tmpFile = new File(filePath + File.separator + "tmp" + File.separator+ uploadFileName);
				dirYn = new File(filePath + File.separator + dir) ;

				if(!dirYn.exists())
					dirYn.mkdir() ;

				tmpFile.setReadable(true, false);

				if(!dirYn.exists())
					dirYn.mkdir() ;
				FileUtils.copyFile(uploadFile, tmpFile);

				/* 4. 게시판 구분 폴더로 파일 이동 */
				String changeFile = System.currentTimeMillis()+uploadFileName.substring(uploadFileName.indexOf(".") , uploadFileName.length());
				File dirFile = new File(filePath + File.separator + dir+File.separator+changeFile);
				FileUtils.copyFile(tmpFile, dirFile);
				dirFile.setReadable(true, false);

				fileMap.put("PTH_FILE_LOGI"		, filePath + File.separator + dir+File.separator+uploadFileName);
				fileMap.put("PTH_FILE_PHYS" 		, filePath + File.separator + dir+File.separator+changeFile);
				fileMap.put("NM_LOGI_FILE"			, uploadFileName);
				fileMap.put("NM_PHYS_FILE"			, changeFile);
				fileMap.put("TY_FILE" 					, uploadContentType);
				fileMap.put("SIZE_FILE" 				, fileSize);

				/* 5. tmp 내 해당 파일 삭제 */
				tmpFile.delete();
			}

		}

		return fileMap ;
	}

	/**
	 * 확장자 검사
	 * @param filename
	 * @return
	 * @throws Exception
	 */
	public boolean checkFilExt(String filename) throws Exception{

		boolean result = true;
		String ext = "";

		int dot = filename.lastIndexOf(".");

		if(dot != -1){
			ext	= filename.substring(dot);
			ext = ext.toLowerCase();
			String str[] = new String[26];

			str[0] = ".php";
			str[1] = ".php3";
			str[2] = ".php5";
			str[3] = ".phtml";
			str[4] = ".asp";
			str[5] = ".aspx";
			str[6] = ".ascx";
			str[7] = ".jsp";
			str[8] = ".cfm";
			str[9] = ".cfc";
			str[10] = ".pl";
			str[11] = ".bat";
			str[12] = ".exe";
			str[13] = ".dll";
			str[14] = ".reg";
			str[15] = ".cgi";
			str[16] = ".html";
			str[17] = ".htm";
			str[18] = ".js";
			str[19] = ".sh";
			str[20] = ".com";
			str[21] = ".class";
			str[22] = ".java";
			str[23] = ".jspx";
			str[24] = ".jspf";
			str[25] = ".jspw";

			ext = ext.trim();
			for(int i=0;i<str.length;i++){
				if(ext.equals(str[i])){
					result = false;
					break;
				}
			}

		}else{
			result = true;
		}

		return result;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
	public List<File> getUploads() {
		return uploads;
	}
	public void setUploads(List<File> uploads) {
		this.uploads = uploads;
	}
	public List<String> getUploadsFileName() {
		return uploadsFileName;
	}
	public void setUploadsFileName(List<String> uploadsFileName) {
		this.uploadsFileName = uploadsFileName;
	}
	public List<String> getUploadsContentType() {
		return uploadsContentType;
	}
	public void setUploadsContentType(List<String> uploadsContentType) {
		this.uploadsContentType = uploadsContentType;
	}
    public List<File> getUploadsThum() {
        return uploadsThum;
    }
    public void setUploadsThum(List<File> uploadsThum) {
        this.uploadsThum = uploadsThum;
    }
    public List<String> getUploadsThumFileName() {
        return uploadsThumFileName;
    }
    public void setUploadsThumFileName(List<String> uploadsThumFileName) {
        this.uploadsThumFileName = uploadsThumFileName;
    }
    public List<String> getUploadsThumContentType() {
        return uploadsThumContentType;
    }
    public void setUploadsThumContentType(List<String> uploadsThumContentType) {
        this.uploadsThumContentType = uploadsThumContentType;
    }
    public String getTarget() {
        return target;
    }
    public void setTarget(String target) {
        this.target = target;
    }
    public boolean isUploadFilecheck() {
        return uploadFilecheck;
    }
    public void setUploadFilecheck(boolean uploadFilecheck) {
        this.uploadFilecheck = uploadFilecheck;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public String getNextURL() {
        return nextURL;
    }
    public void setNextURL(String nextURL) {
        this.nextURL = nextURL;
    }
    public InputStream getInputStream() {
        return inputStream;
    }
    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

}
