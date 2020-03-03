package com.jew.domain;

import java.sql.Date;

public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String userId;
	private String boardContent;
	private int boardAvail;
	private Date regDate;
	private Date updDate;
	

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
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardAvail() {
		return boardAvail;
	}
	public void setBoardAvail(int boardAvail) {
		this.boardAvail = boardAvail;
	}
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", userId=" + userId + ", boardContent="
				+ boardContent + ", boardAvail=" + boardAvail + ", regDate=" + regDate + ", updDate=" + updDate + "]";
	}
}
