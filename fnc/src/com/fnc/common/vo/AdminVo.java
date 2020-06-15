package com.fnc.common.vo;

public class AdminVo {
	
	private String userId;
	private transient String userPw;
	private String userNm;
	private String deptNm;
	private String email;
	private String noMphn;
	private String clAdmnPrsn;
	private String ynLinAble;
	private int    notmEror;
	private String dtPlanChgPwd;
	private String ynExpiredPwd;
	private String ipAdmnPrsn;
	private String loginDate;
	private String newPw;
	private String confirmPw;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getDeptNm() {
		return deptNm;
	}
	public void setDeptNm(String deptNm) {
		this.deptNm = deptNm;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNoMphn() {
		return noMphn;
	}
	public void setNoMphn(String noMphn) {
		this.noMphn = noMphn;
	}
	public String getClAdmnPrsn() {
		return clAdmnPrsn;
	}
	public void setClAdmnPrsn(String clAdmnPrsn) {
		this.clAdmnPrsn = clAdmnPrsn;
	}
	public String getYnLinAble() {
		return ynLinAble;
	}
	public void setYnLinAble(String ynLinAble) {
		this.ynLinAble = ynLinAble;
	}
	public int getNotmEror() {
		return notmEror;
	}
	public void setNotmEror(int notmEror) {
		this.notmEror = notmEror;
	}
	public String getDtPlanChgPwd() {
		return dtPlanChgPwd;
	}
	public void setDtPlanChgPwd(String dtPlanChgPwd) {
		this.dtPlanChgPwd = dtPlanChgPwd;
	}
	public String getYnExpiredPwd() {
		return ynExpiredPwd;
	}
	public void setYnExpiredPwd(String ynExpiredPwd) {
		this.ynExpiredPwd = ynExpiredPwd;
	}
	public String getIpAdmnPrsn() {
		return ipAdmnPrsn;
	}
	public void setIpAdmnPrsn(String ipAdmnPrsn) {
		this.ipAdmnPrsn = ipAdmnPrsn;
	}
	public String getLoginDate() {
		return loginDate;
	}
	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}
	public String getNewPw() {
		return newPw;
	}
	public void setNewPw(String newPw) {
		this.newPw = newPw;
	}
	public String getConfirmPw() {
		return confirmPw;
	}
	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
	}
	@Override
	public String toString() {
		return "AdminVo [userId=" + userId + ", userPw=" + userPw + ", userNm=" + userNm + ", deptNm=" + deptNm
				+ ", email=" + email + ", noMphn=" + noMphn + ", clAdmnPrsn=" + clAdmnPrsn + ", ynLinAble=" + ynLinAble
				+ ", notmEror=" + notmEror + ", dtPlanChgPwd=" + dtPlanChgPwd + ", ynExpiredPwd=" + ynExpiredPwd
				+ ", ipAdmnPrsn=" + ipAdmnPrsn + ", loginDate=" + loginDate + ", newPw=" + newPw + ", confirmPw="
				+ confirmPw + "]";
	}

}
