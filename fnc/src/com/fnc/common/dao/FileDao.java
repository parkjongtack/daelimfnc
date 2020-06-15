package com.fnc.common.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;

import com.fnc.common.vo.FileVo;
import com.fnc.util.SqlReaderXml;
import com.fnc.util.StringManager;

public class FileDao {
	private static Logger logger = Logger.getLogger(FileDao.class);
	
	// 파일 목록
	@SuppressWarnings("unchecked")
	public List<FileVo> selectFileList(String noAtchFileSral) throws SQLException {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("noAtchFileSral", noAtchFileSral);
		return SqlReaderXml.getInstance().queryForList("selectFileList", paramMap);
	}
	
	// 파일
	public FileVo selectFiles(String noAtchFileDtilSral) throws SQLException {

		return (FileVo)SqlReaderXml.getInstance().queryForObject("selectFiles", noAtchFileDtilSral);
	}

	// 파일 등록
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> insertFile(HashMap<String, Object> paramMap) throws SQLException {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String, String>> thumbList = (List<HashMap<String, String>>) paramMap.get("thumbList");
		List<HashMap<String, String>> uploadList = (List<HashMap<String, String>>) paramMap.get("uploadList");

		// 섬네일 등록
		if (thumbList != null && thumbList.size() > 0) {
			// selectKey 가져오기
			int thumbKey = (Integer) SqlReaderXml.getInstance().queryForObject("selectFileKey", paramMap);
			paramMap.put("noAtchFileSral", thumbKey);
			resultMap.put("thumbKey", thumbKey);
			// 파일 묶음
			SqlReaderXml.getInstance().insert("insertFile", paramMap);
			
			for (int i = 0; i < thumbList.size(); i++) {
				// [{nmFileOrgl=정상.jpg, pthFilePhys=D:/upload/, notmDwld=0, pthFileLogi=/upload/, sizeFile=13397, nmTyFile=jpg, nmFileChg=20200422160108uqWS6.jpg}]
				
				paramMap.put("pthFileLogi", thumbList.get(i).get("pthFileLogi").toString());	// 파일패스
				paramMap.put("pthFilePhys", thumbList.get(i).get("pthFilePhys").toString());	// 파일패스
				paramMap.put("nmLogiFile", thumbList.get(i).get("nmFileOrgl").toString());	// 원본파일명
				paramMap.put("nmPhysFile", thumbList.get(i).get("nmFileChg").toString());	// 실제파일명
				paramMap.put("sizeFile", thumbList.get(i).get("sizeFile").toString());	// 파일용량
				paramMap.put("tyFile", thumbList.get(i).get("nmTyFile").toString());	// 파일타입

				paramMap.put("clFile", "");
				paramMap.put("oderMkar", "");
				// paramMap.put("idCrtnPrsn", "");
				paramMap.put("dntRev", "");
				// paramMap.put("ipAdmnPrsn", "");
				
				SqlReaderXml.getInstance().insert("insertFileList", paramMap);
			}
			
		}
		
		// 일반 파일 목록
		if (uploadList != null && uploadList.size() > 0) {
			// selectKey 가져오기
			int fileKey = (Integer) SqlReaderXml.getInstance().queryForObject("selectFileKey", paramMap);
			paramMap.put("noAtchFileSral", fileKey);
			resultMap.put("fileKey", fileKey);
			
			logger.debug("fileMap =========================================== " + paramMap.toString());
			
			String clFile = StringManager.chkNull(paramMap.get("clFile"));
			String[] arrFile = clFile.split("\\|");
			
			// int thumbFileSeq = (Integer) SqlReaderXml.getInstance().insert("insertFile", paramMap);
			SqlReaderXml.getInstance().insert("insertFile", paramMap);

			for (int i = 0; i < uploadList.size(); i++) {
				// [{nmFileOrgl=정상.jpg, pthFilePhys=D:/upload/, notmDwld=0, pthFileLogi=/upload/, sizeFile=13397, nmTyFile=jpg, nmFileChg=20200422160108uqWS6.jpg}]
				
				paramMap.put("pthFileLogi", uploadList.get(i).get("pthFileLogi").toString());	// 파일패스
				paramMap.put("pthFilePhys", uploadList.get(i).get("pthFilePhys").toString());	// 파일패스
				paramMap.put("nmLogiFile", uploadList.get(i).get("nmFileOrgl").toString());	// 원본파일명
				paramMap.put("nmPhysFile", uploadList.get(i).get("nmFileChg").toString());	// 실제파일명
				paramMap.put("sizeFile", uploadList.get(i).get("sizeFile").toString());	// 파일용량
				paramMap.put("tyFile", uploadList.get(i).get("nmTyFile").toString());	// 파일타입
				// paramMap.put("cntsFileDtil", "");

				paramMap.put("cntsfileDtil", "");
				if (!"".equals(clFile)) {
					paramMap.put("clFile", arrFile[i]);
				} else {
					paramMap.put("clFile", "");
				}
				paramMap.put("oderMkar", "");
				// paramMap.put("idCrtnPrsn", "");
				paramMap.put("dntRev", "");
				// paramMap.put("ipAdmnPrsn", "");
				
				if (!"".equals(uploadList.get(i).get("nmFileOrgl").toString())) {
					SqlReaderXml.getInstance().insert("insertFileList", paramMap);
				}
			}
		}
			
		return resultMap;
	}
	
	// 섬네일 파일 수정
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> updateThumbFile(HashMap<String, Object> paramMap) throws SQLException {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String, String>> thumbList = (List<HashMap<String, String>>) paramMap.get("thumbList");
		
		// 섬네일 등록
		if (thumbList.size() > 0) {
			// selectKey 가져오기
			// int thumbKey = (Integer) SqlReaderXml.getInstance().queryForObject("selectFileKey", paramMap);
			// paramMap.put("noAtchFileSral", thumbKey);
			// resultMap.put("thumbKey", thumbKey);
			
			
			// 파일 묶음
			// SqlReaderXml.getInstance().insert("insertFile", paramMap);
			
			System.out.println("섬네일 파일 갯수 : " + thumbList.size());
			for (int i = 0; i < thumbList.size(); i++) {
				// [{nmFileOrgl=정상.jpg, pthFilePhys=D:/upload/, notmDwld=0, pthFileLogi=/upload/, sizeFile=13397, nmTyFile=jpg, nmFileChg=20200422160108uqWS6.jpg}]
				paramMap.put("pthFileLogi", thumbList.get(i).get("pthFileLogi").toString());	// 파일패스
				paramMap.put("pthFilePhys", thumbList.get(i).get("pthFilePhys").toString());	// 파일패스
				paramMap.put("nmLogiFile", thumbList.get(i).get("nmFileOrgl").toString());	// 원본파일명
				paramMap.put("nmPhysFile", thumbList.get(i).get("nmFileChg").toString());	// 실제파일명
				paramMap.put("sizeFile", thumbList.get(i).get("sizeFile").toString());	// 파일용량
				paramMap.put("tyFile", thumbList.get(i).get("nmTyFile").toString());	// 파일타입
				
				SqlReaderXml.getInstance().update("updateFile", paramMap);
			}
		}
		
		return resultMap;
	}
	
	//  파일 수정
	@SuppressWarnings("unchecked")
	public HashMap<String, Object> updateFile(HashMap<String, Object> paramMap) throws SQLException {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<HashMap<String, String>> uploadList = (List<HashMap<String, String>>) paramMap.get("uploadList");
		List<String> updateSeqList = (List<String>) paramMap.get("updateSeqList");
		List<String> deleteSeqList = (List<String>) paramMap.get("deleteSeqList");
		List<String> updateList = (List<String>) paramMap.get("updateList");
		List<String> deleteList = (List<String>) paramMap.get("deleteList");
		List<String> clFileList = (List<String>) paramMap.get("clFileList");
		
		
		// 섬네일 등록, 수정
//		if (uploadList != null && uploadList.size() > 0) {
			for (int i = 0; i < updateList.size(); i++) {
				// [{nmFileOrgl=정상.jpg, pthFilePhys=D:/upload/, notmDwld=0, pthFileLogi=/upload/, sizeFile=13397, nmTyFile=jpg, nmFileChg=20200422160108uqWS6.jpg}]
				if ("N".equals(updateList.get(i))) {
					paramMap.put("pthFileLogi", uploadList.get(i).get("pthFileLogi").toString());	// 파일패스
					paramMap.put("pthFilePhys", uploadList.get(i).get("pthFilePhys").toString());	// 파일패스
					paramMap.put("nmLogiFile", uploadList.get(i).get("nmFileOrgl").toString());	// 원본파일명
					paramMap.put("nmPhysFile", uploadList.get(i).get("nmFileChg").toString());	// 실제파일명
					paramMap.put("sizeFile", uploadList.get(i).get("sizeFile").toString());	// 파일용량
					paramMap.put("tyFile", uploadList.get(i).get("nmTyFile").toString());	// 파일타입
					paramMap.put("clFile", clFileList.get(i).toString());	// 파일타입
					
					SqlReaderXml.getInstance().insert("insertModifyFile", paramMap); 
				} else if ("M".equals(updateList.get(i))) {
					paramMap.put("noAtchFileDtilSral", updateSeqList.get(i));
					if(uploadList.size() != 0){
						paramMap.put("pthFileLogi", uploadList.get(i).get("pthFileLogi").toString());	// 파일패스
						paramMap.put("pthFilePhys", uploadList.get(i).get("pthFilePhys").toString());	// 파일패스
						paramMap.put("nmLogiFile", uploadList.get(i).get("nmFileOrgl").toString());	// 원본파일명
						paramMap.put("nmPhysFile", uploadList.get(i).get("nmFileChg").toString());	// 실제파일명
						paramMap.put("sizeFile", uploadList.get(i).get("sizeFile").toString());	// 파일용량
						paramMap.put("tyFile", uploadList.get(i).get("nmTyFile").toString());	// 파일타입
					}
					SqlReaderXml.getInstance().update("updateFile", paramMap);
				}
			}
//		}
		
		// 섬네일 삭제
		for (int i = 0; i < deleteList.size(); i++) {
			paramMap.put("noAtchFileDtilSral", deleteSeqList.get(i));
			SqlReaderXml.getInstance().delete("deleteFile", paramMap);
		}
		
		return resultMap;
	}
}
