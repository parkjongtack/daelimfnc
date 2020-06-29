package com.fnc.admin.vo;

public class BizVo2 {

	private int noPrdtSral;		// 상품일련번호
	private String cdCtgr;		// 카테고리
	private String cdPdCtUse;	// 제품용도
	private String nmPdCt;		// 제품명(Grade)
	private String atrb1;		// 속성1
	private String atrb2;		// 속성2
	private String atrb3;		// 속성3
	private String atrb4; 		// 속성4
	
	private String atrb5;		// 속성5
	private String noAtchFileSral;	// 첨부파일일련번호
	private String clKoEng;		// 국문영문구분 K:국문 E:영문
	private String clMbil;		// 모바일구분 P:Pc M:모바일
	private String ynNtc;		// 게시여부 Y:게시 N:게시안함
	private String ynElmn;		// 삭제여부 Y:삭제 N:삭제안함
	private String idCrtnPrsn;	// 등록자
	private String dntCrtn;		// 등록일자
	private String idRevPrsn;	// 수정자
	private String dntRev;		// 수정일
	private String ipAdmnPrsn;	// IP
	private int fileSeq;		// 첨부파일 시퀀스
	private int ROWNUM;
	private String noAtchFileDtilSral1;
	private String fileName1;
	private String clFile1;
	private String noAtchFileDtilSral2;
	private String fileName2;
	private String clFile2;
	private String noAtchFileDtilSral3;
	private String fileName3;
	private String clFile3;
	
	private String searchType;			// 검색타입
	private String searchData;			// 검색데이터
	
	private String atrb_2_en;
	private String atrb_3_en;	
	
	private String sNum;
	private String eNum;	
	
	private String atrb_4_en;
	private String cdPdCtUseEn;	
	
	public String getAtrb2() {
		return atrb2;
	}
	public void setAtrb2(String atrb2) {
		this.atrb2 = atrb2;
	}
	public String getAtrb3() {
		return atrb3;
	}
	public void setAtrb3(String atrb3) {
		this.atrb3 = atrb3;
	}
	public String getAtrb4() {
		return atrb4;
	}
	public void setAtrb4(String atrb4) {
		this.atrb4 = atrb4;
	}
	public String getAtrb5() {
		return atrb5;
	}
	public void setAtrb5(String atrb5) {
		this.atrb5 = atrb5;
	}

	
	public String getAtrb_3_en() {
		return atrb_3_en;
	}
	public void setAtrb_3_en(String atrb_3_en) {
		this.atrb_3_en = atrb_3_en;
	}

	
	public String getCdPdCtUseEn() {
		return cdPdCtUseEn;
	}
	public void setCdPdCtUseEn(String cdPdCtUseEn) {
		this.cdPdCtUseEn = cdPdCtUseEn;
	}
	public String getAtrb_2_en() {
		return atrb_2_en;
	}
	public void setAtrb_2_en(String atrb_2_en) {
		this.atrb_2_en = atrb_2_en;
	}
	public String getAtrb_4_en() {
		return atrb_4_en;
	}
	public void setAtrb_4_en(String atrb_4_en) {
		this.atrb_4_en = atrb_4_en;
	}
	public int getNoPrdtSral() {
		return noPrdtSral;
	}
	public void setNoPrdtSral(int noPrdtSral) {
		this.noPrdtSral = noPrdtSral;
	}
	public String getCdCtgr() {
		return cdCtgr;
	}
	public void setCdCtgr(String cdCtgr) {
		this.cdCtgr = cdCtgr;
	}
	public String getCdPdCtUse() {
		return cdPdCtUse;
	}
	public void setCdPdCtUse(String cdPdCtUse) {
		this.cdPdCtUse = cdPdCtUse;
	}
	public String getNmPdCt() {
		return nmPdCt;
	}
	public void setNmPdCt(String nmPdCt) {
		this.nmPdCt = nmPdCt;
	}
	public String getAtrb1() {
		return atrb1;
	}
	public void setAtrb1(String atrb1) {
		this.atrb1 = atrb1;
	}
	public String getNoAtchFileSral() {
		return noAtchFileSral;
	}
	public void setNoAtchFileSral(String noAtchFileSral) {
		this.noAtchFileSral = noAtchFileSral;
	}
	public String getClKoEng() {
		return clKoEng;
	}
	public void setClKoEng(String clKoEng) {
		this.clKoEng = clKoEng;
	}
	public String getClMbil() {
		return clMbil;
	}
	public void setClMbil(String clMbil) {
		this.clMbil = clMbil;
	}
	public String getYnNtc() {
		return ynNtc;
	}
	public void setYnNtc(String ynNtc) {
		this.ynNtc = ynNtc;
	}
	public String getYnElmn() {
		return ynElmn;
	}
	public void setYnElmn(String ynElmn) {
		this.ynElmn = ynElmn;
	}
	public String getIdCrtnPrsn() {
		return idCrtnPrsn;
	}
	public void setIdCrtnPrsn(String idCrtnPrsn) {
		this.idCrtnPrsn = idCrtnPrsn;
	}
	public String getDntCrtn() {
		return dntCrtn;
	}
	public void setDntCrtn(String dntCrtn) {
		this.dntCrtn = dntCrtn;
	}
	public String getIdRevPrsn() {
		return idRevPrsn;
	}
	public void setIdRevPrsn(String idRevPrsn) {
		this.idRevPrsn = idRevPrsn;
	}
	public String getDntRev() {
		return dntRev;
	}
	public void setDntRev(String dntRev) {
		this.dntRev = dntRev;
	}
	public String getIpAdmnPrsn() {
		return ipAdmnPrsn;
	}
	public void setIpAdmnPrsn(String ipAdmnPrsn) {
		this.ipAdmnPrsn = ipAdmnPrsn;
	}
	public int getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public int getROWNUM() {
		return ROWNUM;
	}
	public void setROWNUM(int rOWNUM) {
		ROWNUM = rOWNUM;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchData() {
		return searchData;
	}
	public void setSearchData(String searchData) {
		this.searchData = searchData;
	}
	public String getsNum() {
		return sNum;
	}
	public void setsNum(String sNum) {
		this.sNum = sNum;
	}
	public String geteNum() {
		return eNum;
	}
	public void seteNum(String eNum) {
		this.eNum = eNum;
	}

	public String getNoAtchFileDtilSral1() {
		return noAtchFileDtilSral1;
	}
	public void setNoAtchFileDtilSral1(String noAtchFileDtilSral1) {
		this.noAtchFileDtilSral1 = noAtchFileDtilSral1;
	}
	public String getFileName1() {
		return fileName1;
	}
	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}
	public String getClFile1() {
		return clFile1;
	}
	public void setClFile1(String clFile1) {
		this.clFile1 = clFile1;
	}
	public String getNoAtchFileDtilSral2() {
		return noAtchFileDtilSral2;
	}
	public void setNoAtchFileDtilSral2(String noAtchFileDtilSral2) {
		this.noAtchFileDtilSral2 = noAtchFileDtilSral2;
	}
	public String getFileName2() {
		return fileName2;
	}
	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}
	public String getClFile2() {
		return clFile2;
	}
	public void setClFile2(String clFile2) {
		this.clFile2 = clFile2;
	}
	public String getNoAtchFileDtilSral3() {
		return noAtchFileDtilSral3;
	}
	public void setNoAtchFileDtilSral3(String noAtchFileDtilSral3) {
		this.noAtchFileDtilSral3 = noAtchFileDtilSral3;
	}
	public String getFileName3() {
		return fileName3;
	}
	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}
	public String getClFile3() {
		return clFile3;
	}
	public void setClFile3(String clFile3) {
		this.clFile3 = clFile3;
	}

	@Override
	public String toString() {
		return "BizVo [noPrdtSral=" + noPrdtSral + ", " + (cdCtgr != null ? "cdCtgr=" + cdCtgr + ", " : "")
				+ (cdPdCtUse != null ? "cdPdCtUse=" + cdPdCtUse + ", " : "")
				+ (nmPdCt != null ? "nmPdCt=" + nmPdCt + ", " : "") + (atrb1 != null ? "atrb1=" + atrb1 + ", " : "")
				+ (atrb2 != null ? "atrb2=" + atrb2 + ", " : "") + (atrb3 != null ? "atrb3=" + atrb3 + ", " : "")
				+ (atrb4 != null ? "atrb4=" + atrb4 + ", " : "") + (atrb5 != null ? "atrb5=" + atrb5 + ", " : "")
				+ "noAtchFileSral=" + noAtchFileSral + ", " + (clKoEng != null ? "clKoEng=" + clKoEng + ", " : "")
				+ (clMbil != null ? "clMbil=" + clMbil + ", " : "") + (ynNtc != null ? "ynNtc=" + ynNtc + ", " : "")
				+ (ynElmn != null ? "ynElmn=" + ynElmn + ", " : "")
				+ (idCrtnPrsn != null ? "idCrtnPrsn=" + idCrtnPrsn + ", " : "")
				+ (dntCrtn != null ? "dntCrtn=" + dntCrtn + ", " : "")
				+ (idRevPrsn != null ? "idRevPrsn=" + idRevPrsn + ", " : "")
				+ (dntRev != null ? "dntRev=" + dntRev + ", " : "")
				+ (ipAdmnPrsn != null ? "ipAdmnPrsn=" + ipAdmnPrsn + ", " : "") + "fileSeq=" + fileSeq + ", ROWNUM="
				+ ROWNUM + ", " + (searchType != null ? "searchType=" + searchType + ", " : "")
				+ (searchData != null ? "searchData=" + searchData + ", " : "")
				+ (sNum != null ? "sNum=" + sNum + ", " : "") + (eNum != null ? "eNum=" + eNum : "") + (atrb_2_en != null ? "atrb_2_en=" + atrb_2_en : "") + (atrb_4_en != null ? "atrb_4_en=" + atrb_4_en : "") + (cdPdCtUseEn != null ? "cdPdCtUseEn=" + cdPdCtUseEn : "") + "]";
	}
	
}
