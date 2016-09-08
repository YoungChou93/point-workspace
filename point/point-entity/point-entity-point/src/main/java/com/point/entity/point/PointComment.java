package com.point.entity.point;

import java.util.Date;

import javax.validation.constraints.Size;

import com.point.entity.user.UserPart;

public class PointComment {
   
	private String id;

	@Size(min=16,max=16,message="{PointComment.pointid.length.error}")
    private String pointid;

    private UserPart user;
    
    @Size(min=1,max=109,message="{PointComment.Comment.length.error}")
    private String comment;

    private Integer praise;

    private Date createtime;

    private Integer status;

    private String unused1;

    private String unused2;

    
    public PointComment() {
	}
    
	public PointComment(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "PointComment [id=" + id + ", pointid=" + pointid + ", user=" + user + ", comment=" + comment
				+ ", praise=" + praise + ", createtime=" + createtime + ", status=" + status + ", unused1=" + unused1
				+ ", unused2=" + unused2 + "]";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPointid() {
		return pointid;
	}

	public void setPointid(String pointid) {
		this.pointid = pointid;
	}

	public UserPart getUser() {
		return user;
	}

	public void setUser(UserPart user) {
		this.user = user;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Integer getPraise() {
		return praise;
	}

	public void setPraise(Integer praise) {
		this.praise = praise;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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