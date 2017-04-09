package com.point.entity.user;

import java.util.Date;

public class LoginRecord {
    private String id;

    private User user;

    private Date logintime;

    private String loginip;

    private Date logouttime;

    private String unused1;

    private String unused2;

	public LoginRecord() {
	}
	

	public LoginRecord(String id) {
		this.id = id;
	}


	@Override
	public String toString() {
		return "LoginRecord [id=" + id + ", user=" + user + ", logintime=" + logintime + ", loginip=" + loginip
				+ ", logouttime=" + logouttime + ", unused1=" + unused1 + ", unused2=" + unused2 + "]";
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public Date getLogintime() {
		return logintime;
	}


	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}


	public String getLoginip() {
		return loginip;
	}


	public void setLoginip(String loginip) {
		this.loginip = loginip;
	}


	public Date getLogouttime() {
		return logouttime;
	}


	public void setLogouttime(Date logouttime) {
		this.logouttime = logouttime;
	}


	public String getUnused1() {
		return unused1;
	}


	public void setUnused1(String unused1) {
		this.unused1 = unused1;
	}


	public String getUnused2() {
		return unused2;
	}


	public void setUnused2(String unused2) {
		this.unused2 = unused2;
	}

}