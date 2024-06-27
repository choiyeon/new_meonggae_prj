package com.store.meonggae.my.vo;

public class PwVO {
	
	private String memNum, pass;

	public PwVO(String memNum, String pass) {
		super();
		this.memNum = memNum;
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "PwVO [memNum=" + memNum + ", pass=" + pass + "]";
	}

	public String getMemNum() {
		return memNum;
	}

	public void setMemNum(String memNum) {
		this.memNum = memNum;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
	
}
