package com.point.entity.user;

public class OnlineUser {
    private String id;

    private User user;

    private String sessionid;

    private String ipcode;

    private String unused1;

    private String unused2;

    public OnlineUser() {

	}
    
	public OnlineUser(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "OnlineUser [id=" + id + ", user=" + user + ", sessionid=" + sessionid + ", ipcode=" + ipcode
				+ ", unused1=" + unused1 + ", unused2=" + unused2 + "]";
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

	public String getSessionid() {
		return sessionid;
	}

	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}

	public String getIpcode() {
		return ipcode;
	}

	public void setIpcode(String ipcode) {
		this.ipcode = ipcode;
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