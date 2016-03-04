package com.point.entity.user.custom;

import javax.validation.constraints.NotNull;

import com.point.entity.user.User;

public class UserCustom extends User {

	@NotNull(message="{usercustom.verifyCode.isnull}")
	private String verifyCode;
	
	private String confirmPassword;
	
	public UserCustom() {
		super();
	}

	public UserCustom(String uid) {
		super(uid);
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

}
