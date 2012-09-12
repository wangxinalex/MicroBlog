package org.bll;

import java.sql.Timestamp;

public class Blog {
	private int id;
	private String text;
	private int publisherid;
	private int originalid;
	private Timestamp posttime;
	public Blog(){}
	public Blog(int id, String text,int publisherid){
		this.id=id;
		this.text=text;
		this.publisherid=publisherid;
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getPublisherid() {
		return publisherid;
	}
	public void setPublisherid(int publisherid) {
		this.publisherid = publisherid;
	}
	public int getOriginalid() {
		return originalid;
	}
	public void setOriginalid(int originalid) {
		this.originalid = originalid;
	}
	public Timestamp getPosttime() {
		return posttime;
	}
	public void setPosttime(Timestamp posttime) {
		this.posttime = posttime;
	}
	
	@SuppressWarnings("deprecation")
	public String getTimeStr(){
		return posttime.toLocaleString();
	}
	@Override
	public String toString(){
		String blogStr = "{blogid = "+id+", blogtext = "+text+", publisherid = "+publisherid+","+"originalblog = "+originalid+"}";
		return blogStr;
		
	}
	
}
