package com.store.meonggae.user.login.domain;

import java.util.Date;


public class LoginDomain {
	private int memNum;
	private String nick, id, pass, img, memStatus, suspendFlag, loginFlag, withdrawFlag;
	private Date suspendDate, unsuspendDate, withdrawDate;
	
	public LoginDomain() {
		
	}
	
	public LoginDomain(int memNum, String nick, String id, String pass, String img, String memStatus, String suspendFlag, String loginFlag, String withdrawFlag, Date suspendDate,
			Date unsuspendDate, Date withdrawDate) {
		this.memNum = memNum;
		this.nick = nick;
		this.id = id;
		this.pass = pass;
		this.img = img;
		this.memStatus = memStatus;
		this.suspendFlag = suspendFlag;
		this.loginFlag = loginFlag;
		this.withdrawFlag = withdrawFlag;
		this.suspendDate = suspendDate;
		this.unsuspendDate = unsuspendDate;
		this.withdrawDate = withdrawDate;
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

	public int getMemNum() {
		return memNum;
	}

	public void setMemNum(int memNum) {
		this.memNum = memNum;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getimg() {
		return img;
	}

	public void setimg(String img) {
		this.img = img;
	}

	public String getMemStatus() {
		return memStatus;
	}

	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}

	public String getSuspendFlag() {
		return suspendFlag;
	}

	public void setSuspendFlag(String suspendFlag) {
		this.suspendFlag = suspendFlag;
	}

	public String getLoginFlag() {
		return loginFlag;
	}

	public void setLoginFlag(String loginFlag) {
		this.loginFlag = loginFlag;
	}

	public String getWithdrawFlag() {
		return withdrawFlag;
	}

	public void setWithdrawFlag(String withdrawFlag) {
		this.withdrawFlag = withdrawFlag;
	}

	public Date getSuspendDate() {
		return suspendDate;
	}

	public void setSuspendDate(Date suspendDate) {
		this.suspendDate = suspendDate;
	}

	public Date getUnsuspendDate() {
		return unsuspendDate;
	}

	public void setUnsuspendDate(Date unsuspendDate) {
		this.unsuspendDate = unsuspendDate;
	}

	public Date getWithdrawDate() {
		return withdrawDate;
	}

	public void setWithdrawDate(Date withdrawDate) {
		this.withdrawDate = withdrawDate;
	}

	@Override
	public String toString() {
		return "LoginDomain [memNum=" + memNum + ", nick=" + nick + ", id=" + id + ", pass=" + pass + ", img=" + img +", memStatus=" + memStatus + ", suspendFlag=" + suspendFlag + ", loginFlag=" + loginFlag
				+ ", withdrawFlag=" + withdrawFlag + ", suspendDate=" + suspendDate + ", unsuspendDate=" + unsuspendDate
				+ ", withdrawDate=" + withdrawDate + "]";
	}
	
}
