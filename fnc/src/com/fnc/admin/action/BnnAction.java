package com.fnc.admin.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.fnc.admin.dao.BnnDao;
import com.fnc.admin.vo.BnnVo;
import com.fnc.common.dao.FileDao;
import com.fnc.common.vo.FileVo;
import com.fnc.util.BaseAction;

public class BnnAction extends BaseAction {

    private static final long serialVersionUID = 1L;
    private static Logger logger = Logger.getLogger(BnnAction.class);

    BnnDao dao = new BnnDao();
    FileDao fileDao = new FileDao();

    // 이미지 정보
    private BnnVo resultVo; // 결과 값
    private List<FileVo> mainImgVoList;	// 섬네일 파일
    private Map resultMap;

    public Map getResultMap() {
        return resultMap;
    }

    public void setResultMap(Map resultMap) {
        this.resultMap = resultMap;
    }

    public BnnVo getResultVo() {
        return resultVo;
    }

    public void setResultVo(BnnVo resultVo) {
        this.resultVo = resultVo;
    }

    public List<FileVo> getMainImgVoList() {
        return mainImgVoList;
    }

    public void setMainImgVoList(List<FileVo> mainImgVoList) {
        this.mainImgVoList = mainImgVoList;
    }

    // 메인이미지 등록 & 수정
    public String mainRegiExcute() throws Exception {
        //파라미터
        HashMap<String, Object> paramMap = getMap();
        //파일맵
        HashMap<String, Object> fileMap = new HashMap<String, Object>();
        //등록 이미지 리스트
        List<HashMap<String, String>> uploadImgList = getImageMaps();

        //기등록 되어있는 배너 정보 조회
//        HashMap bnnMap = dao.selectMainImg();

        //파일 변경한 col - idx
		String uploadedIdx = (String) paramMap.get("uploadIdxs");
		if(!uploadedIdx.isEmpty()){
			String [] uploadIdxs = uploadedIdx.split(",");
			int i=0;
			for(String s : uploadIdxs){
				Map<String,String> img = uploadImgList.get(i);
				String path = img.get("pthFileLogiCmnty")+img.get("nmFileChg");
				String onm = img.get("nmFileOrgl");
				String imgColVal = path+"|"+onm;
				paramMap.put("img"+s,imgColVal);
				i++;
			}
		}

        int cnt = dao.selectMainImgCnt();
        if(cnt > 0){
        	dao.updateMainImg(paramMap);
        }else{
        	//기존 배너 이미지 삭제
        	dao.deleteMainImg();
        	dao.insertMainImg(paramMap);
        }
        return SUCCESS;
    }

    // 메인이미지 정보 조회
    public String mainReadExcute() throws Exception {
        this.resultMap = dao.selectMainImg();
        String img1 = (String) resultMap.get("IMG_1");
        String img2 = (String) resultMap.get("IMG_2");
        String img3 = (String) resultMap.get("IMG_3");

        if(img1 != null && !"".equals(img1)){
            resultMap.put("src1", img1.split("|")[0]);
            resultMap.put("onm1", img1.split("|")[1]);
        }
        if(img2 != null && !"".equals(img2)){
            resultMap.put("src2", img2.split("|")[0]);
            resultMap.put("onm2", img2.split("|")[1]);
        }
        if(img3 != null && !"".equals(img3)){
        	resultMap.put("src3", img3.split("|")[0]);
        	resultMap.put("onm3", img3.split("|")[1]);
        }
        return SUCCESS;
    }



}
