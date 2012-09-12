package org.bll;

import java.sql.Timestamp;

public class User {
	private String username;
	private int id;	
	private String comefrom;
	private String nickname;	
	private String headurl;
	
	private String password;
	private Timestamp regtime;
	
	public User(){
		
	}
	
	public User(int id,String username,String nickname,String headurl,String comefrom){
		this.id=id;
		this.username=username;
		this.nickname=nickname;
		this.headurl=headurl;
		this.comefrom=comefrom;
	}
	public String getHeadurl() {
		return headurl;
	}
	public void setHeadurl(String headurl) {
		this.headurl = headurl;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	public Timestamp getRegtime() {
		return regtime;
	}
	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}
	public String getComefrom() {
		return comefrom;
	}
	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString(){
		String userStr = "{userid = "+id+", username = "+username+", nickname = "+nickname+", usercomefrom = "+comefrom+"}";
		return userStr;
	}
}
