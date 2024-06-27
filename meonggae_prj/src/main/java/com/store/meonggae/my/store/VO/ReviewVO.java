package com.store.meonggae.my.store.VO;

public class ReviewVO {
	
	private String num;
	private int startNum, endNum;
	
	public ReviewVO(String num, int startNum, int endNum) {
		super();
		this.num = num;
		this.startNum = startNum;
		this.endNum = endNum;
	}
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	@Override
	public String toString() {
		return super.toString();
	}
	
}
