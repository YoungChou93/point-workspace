package com.point.util;

public class PointException extends Exception {
	
	//异常信息
	private String message;

	public PointException(String message) {
		super();
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	

}
