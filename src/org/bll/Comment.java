package org.bll;

import java.sql.Timestamp;

public class Comment {
	private int id;
	private String commenttxt;
	private int publisherid;
	private int targetblogid;
	private Timestamp commenttime;
	
	public int getId() {
		return id;
	}
	public void setId(int commentid) {
		this.id = commentid;
	}
	public String getText() {
		return commenttxt;
	}
	public void setText(String blogtxt) {
		this.commenttxt = blogtxt;
	}
	public int getPublisherid() {
		return publisherid;
	}
	public void setPublisherid(int publisherid) {
		this.publisherid = publisherid;
	}
	public int getTargetblogid() {
		return targetblogid;
	}
	public void setTargetblogid(int targetblogid) {
		this.targetblogid = targetblogid;
	}
	public Timestamp getCommentTime() {
		return commenttime;
	}
	public void setCommentTime(Timestamp commenttime) {
		this.commenttime = commenttime;
	}
	@SuppressWarnings("deprecation")
	public String getCommentTimeStr(){
		return commenttime.toLocaleString();
	}

}
