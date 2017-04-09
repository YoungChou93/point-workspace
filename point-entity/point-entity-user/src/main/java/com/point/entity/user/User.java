package com.point.entity.user;

import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Range;

import com.point.validation.LoginValidation;
import com.point.validation.ModifyPassword;
import com.point.validation.ModifyUserInfo;
import com.point.validation.RegisterValidation;

public class User {
    private String uid;

    @Email(message="{user.email.error}",groups={RegisterValidation.class})
    @Size(min=1,max=40,message="{user.email.length.error}",groups={LoginValidation.class,RegisterValidation.class})
    private String email;

    @Size(min=1,max=15,message="{user.password.length.error}",groups={LoginValidation.class,RegisterValidation.class,ModifyPassword.class})
    private String password;

    @Size(min=1,max=10,message="{user.nickname.length.error}",groups={RegisterValidation.class})
    private String nickname;

    @Range(min=0, max=1,message="{user.gender.Range.error}",groups={ModifyUserInfo.class})
    private Byte gender;

    private Byte status;

    private String activationcode;

    private String headpicture;

    private Date registertime;

    private Integer logincounts;

    private Integer score;

    private Byte role;

    @Size(min=0, max=15,message="{user.weibo.length.error}",groups={ModifyUserInfo.class})
    private String weibo;

    @Size(min=0, max=15,message="{user.qq.length.error}",groups={ModifyUserInfo.class})
    private String qq;

    @Size(min=0, max=100,message="{user.brief.length.error}",groups={ModifyUserInfo.class})
    private String brief;
    
    @Size(min=0, max=15,message="{user.location.length.error}",groups={ModifyUserInfo.class})
    private String location;

    private Date lasttime;

    private String lastip;

    private String unused1;

    private String unused2;

    private String unused3;
    
    
    

    public User() {
	}
    
    

	public User(String uid) {
		this.uid = uid;
	}

    

	@Override
	public String toString() {
		return "User [uid=" + uid + ", email=" + email + ", password=" + password + ", nickname=" + nickname
				+ ", gender=" + gender + ", status=" + status + ", activationcode=" + activationcode + ", headpicture="
				+ headpicture + ", registertime=" + registertime + ", logincounts=" + logincounts + ", score=" + score
				+ ", role=" + role + ", weibo=" + weibo + ", qq=" + qq + ", brief=" + brief + ", location=" + location
				+ ", lasttime=" + lasttime + ", lastip=" + lastip + ", unused1=" + unused1 + ", unused2=" + unused2
				+ ", unused3=" + unused3 + "]";
	}



	public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid == null ? null : uid.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public Byte getGender() {
        return gender;
    }

    public void setGender(Byte gender) {
        this.gender = gender;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getActivationcode() {
        return activationcode;
    }

    public void setActivationcode(String activationcode) {
        this.activationcode = activationcode == null ? null : activationcode.trim();
    }

    public String getHeadpicture() {
        return headpicture;
    }

    public void setHeadpicture(String headpicture) {
        this.headpicture = headpicture == null ? null : headpicture.trim();
    }

    public Date getRegistertime() {
        return registertime;
    }

    public void setRegistertime(Date registertime) {
        this.registertime = registertime;
    }

    public Integer getLogincounts() {
        return logincounts;
    }

    public void setLogincounts(Integer logincounts) {
        this.logincounts = logincounts;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Byte getRole() {
        return role;
    }

    public void setRole(Byte role) {
        this.role = role;
    }

    public String getWeibo() {
        return weibo;
    }

    public void setWeibo(String weibo) {
        this.weibo = weibo == null ? null : weibo.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief == null ? null : brief.trim();
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location == null ? null : location.trim();
    }

    public Date getLasttime() {
        return lasttime;
    }

    public void setLasttime(Date lasttime) {
        this.lasttime = lasttime;
    }

    public String getLastip() {
        return lastip;
    }

    public void setLastip(String lastip) {
        this.lastip = lastip == null ? null : lastip.trim();
    }

    public String getUnused1() {
        return unused1;
    }

    public void setUnused1(String unused1) {
        this.unused1 = unused1 == null ? null : unused1.trim();
    }

    public String getUnused2() {
        return unused2;
    }

    public void setUnused2(String unused2) {
        this.unused2 = unused2 == null ? null : unused2.trim();
    }

    public String getUnused3() {
        return unused3;
    }

    public void setUnused3(String unused3) {
        this.unused3 = unused3 == null ? null : unused3.trim();
    }
}