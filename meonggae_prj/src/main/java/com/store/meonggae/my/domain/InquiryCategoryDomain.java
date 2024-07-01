package com.store.meonggae.my.domain;

public class InquiryCategoryDomain {
	
	private String categoryNum, name;

	public InquiryCategoryDomain() {
		super();
	}

	public InquiryCategoryDomain(String categoryNum, String name) {
		super();
		this.categoryNum = categoryNum;
		this.name = name;
	}

	public String getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "InquiryCategoryDomain [categoryNum=" + categoryNum + ", name=" + name + "]";
	}

}
