package com.point.entity.point;

import java.util.Date;

import javax.validation.constraints.Size;

import com.point.entity.user.User;
import com.point.entity.user.UserPart;

public class Point {
	
    private String pointid;

    @Size(min=1,max=40,message="{point.title.length.error}")
    private String title;
    @Size(min=8,max=10,message="{point.longitude.length.error}")
    private String longitude;
    @Size(min=8,max=10,message="{point.latitude.length.error}")
    private String latitude;

    private Date createtime;

    @Size(min=1,max=10,message="{point.city.length.error}")
    private String city;

    private Integer status;

    private String bigphoto;

    private String smallphoto;

    private UserPart user;

    private Integer praise;

    private Integer down;

    private String label;

    private String unused1;

    private String unused2;

    private String unused3;
    @Size(min=1,max=500,message="{point.content.length.error}")
    private String content;
    
    
    public Point() {

	}

	public Point(String pointid) {
		this.pointid = pointid;
	}

	public String getPointid() {
		return pointid;
	}

	public void setPointid(String pointid) {
		this.pointid = pointid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getBigphoto() {
		return bigphoto;
	}

	public void setBigphoto(String bigphoto) {
		this.bigphoto = bigphoto;
	}

	public String getSmallphoto() {
		return smallphoto;
	}

	public void setSmallphoto(String smallphoto) {
		this.smallphoto = smallphoto;
	}

	public UserPart getUser() {
		return user;
	}

	public void setUser(UserPart user) {
		this.user = user;
	}

	public Integer getPraise() {
		return praise;
	}

	public void setPraise(Integer praise) {
		this.praise = praise;
	}

	public Integer getDown() {
		return down;
	}

	public void setDown(Integer down) {
		this.down = down;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
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

	public String getUnused3() {
		return unused3;
	}

	public void setUnused3(String unused3) {
		this.unused3 = unused3;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Point [pointid=" + pointid + ", title=" + title + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", createtime=" + createtime + ", city=" + city + ", status=" + status + ", bigphoto=" + bigphoto
				+ ", smallphoto=" + smallphoto + ", user=" + user + ", praise=" + praise + ", down=" + down + ", label="
				+ label + ", unused1=" + unused1 + ", unused2=" + unused2 + ", unused3=" + unused3 + ", content="
				+ content + "]";
	}

    
}