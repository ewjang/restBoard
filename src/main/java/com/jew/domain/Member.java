package com.jew.domain;

import java.sql.Date;

public class Member {

	private String userId;
	private String userPw;
	private String userName;
	private String userMail;
	private String userBirth;
	private String hobby;
	private String job;
	private Date regDate;
	private Date updDate;
	
	//mail인증
	private String authkey;
	private int authstatus;
	
	//도로명 주소 Daum API
	private String addr1;
	private String addr2;
	private String addr3;
	
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdDate() {
		return updDate;
	}
	public void setUpdDate(Date updDate) {
		this.updDate = updDate;
	}
	public String getAuthkey() {
		return authkey;
	}
	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}
	public int getAuthstatus() {
		return authstatus;
	}
	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userMail=" + userMail
				+ ", userBirth=" + userBirth + ", hobby=" + hobby + ", job=" + job + ", regDate=" + regDate
				+ ", updDate=" + updDate + ", authkey=" + authkey + ", authstatus=" + authstatus + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", addr3=" + addr3 + "]";
	}
}
