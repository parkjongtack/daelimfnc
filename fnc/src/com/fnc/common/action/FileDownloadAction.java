package com.fnc.common.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;

import org.apache.log4j.Logger;

import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.FileVo;
import com.fnc.util.BaseAction;

public class FileDownloadAction extends BaseAction {
	
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(FileDownloadAction.class);

	FileDao fileDao = new FileDao();
	
	private InputStream inputStream;
	private String contentDispostion;
	private long contentLength;
	HashMap<String, Object> resultMap = new HashMap<String, Object>();

	public InputStream getInputStream() {
		return inputStream;
	}

	public String getContentDispostion() {
		return contentDispostion;
	}

	public long getContentLength() {
		return contentLength;
	}

	public String execute() throws Exception {

		String fileNo = (String)request.getParameter("idx");
		String dir = (String)request.getParameter("dir");

		FileVo fileVo = fileDao.selectFiles(fileNo);
		
		if (fileVo != null) {
			String nmPhysFile = fileVo.getNmPhysFile();
			String nmLogiFile = cleanXSS(fileVo.getNmLogiFile());
			String filePath = request.getSession().getServletContext().getRealPath("/upload") + "/" + dir + "/" + nmPhysFile;
	
			File fileInfo = new File(filePath);
	
			this.contentLength = fileInfo.length();
			this.contentDispostion = "attachment;filename=" + URLEncoder.encode(nmLogiFile,"UTF-8");
			this.inputStream = new FileInputStream(filePath);
		} else {
			message = "잘못된 파일입니다. 다시 확인하시기 바랍니다.";
            nextURL = "close";
            target = SITE_DOMAIN;
            
            resultMap.put("message", message);
            resultMap.put("nextURL", nextURL);
            resultMap.put("target", target);
            
            return "redirect";
		}
		return "success";
	}

	public static String cleanXSS(String value) {
		value = value.replaceAll("&#40;", "\\(").replaceAll("&#41;", "\\)");
		value = value.replaceAll("&#39;", "'");
		return value;
	}

}
