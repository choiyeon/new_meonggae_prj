package com.store.meonggae.my.vo;

public class PersonalInfoVO {

	private String profile, memnun, nick, tel, zipcode, addr0, addr1;
	
	public PersonalInfoVO() {
	}

	public PersonalInfoVO(String profile, String memnun, String nick, String tel, String zipcode, String addr0,
			String addr1) {
		super();
		this.profile = profile;
		this.memnun = memnun;
		this.nick = nick;
		this.tel = tel;
		this.zipcode = zipcode;
		this.addr0 = addr0;
		this.addr1 = addr1;
	}

	@Override
	public String toString() {
		return "PersonalInfoVO [profile=" + profile + ", memnun=" + memnun + ", nick=" + nick + ", tel=" + tel
				+ ", zipcode=" + zipcode + ", addr0=" + addr0 + ", addr1=" + addr1 + "]";
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getMemnun() {
		return memnun;
	}

	public void setMemnun(String memnun) {
		this.memnun = memnun;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr0() {
		return addr0;
	}

	public void setAddr0(String addr0) {
		this.addr0 = addr0;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

}
