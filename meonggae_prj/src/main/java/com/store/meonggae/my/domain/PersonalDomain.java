package com.store.meonggae.my.domain;

public class PersonalDomain {
	
	private String name, addr, addrDetail, tel;

	@Override
	public String toString() {
		return "PersonalDomain [name=" + name + ", addr=" + addr + ", addrDetail=" + addrDetail + ", tel=" + tel + "]";
	}

	public PersonalDomain(String name, String addr, String addrDetail, String tel) {
		this.name = name;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
