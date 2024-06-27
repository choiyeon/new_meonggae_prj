package com.store.meonggae.my.domain;

public class GoodsDomain {
	
	private int goodsNum;
	private String price, name, img, inputDate;
	
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
		return "GoodsDomain [goodsNum=" + goodsNum + ", price=" + price + ", name=" + name
				+ ", img=" + img + ", inputDate=" + inputDate + "]";
	}
	
}