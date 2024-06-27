package com.store.meonggae.my.store.domain;

public class StoreMainDomain {
	
	private int goodsNum, rnum;
	private String price, name, img;
	private String inputDate;
	public int getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(int goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getInputDate() {
		return inputDate;
	}
	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}
	
	@Override
	public String toString() {
		return "StoreMainDomain [goodsNum=" + goodsNum + ", price=" + price + ", rnum=" + rnum + ", name=" + name
				+ ", img=" + img + ", inputDate=" + inputDate + "]";
	}
	
}