package com.store.meonggae.user.login.vo;



public class LoginVO {
	private String id, pass;

	public LoginVO(String id, String pass) {
		super();
		this.id = id;
		this.pass = pass;
	}

	public LoginVO(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}
}