package com.store.meonggae.product.domain;

import org.springframework.web.multipart.MultipartFile;

public class ProductDomain {
	private String goodsNum, name, detail, quality_code, category_num,  price, cnt, trade_method_code, category, location, sell_status_code;
	private MultipartFile img;
	private String imgFileName;
	private int mem_num_sell, delivery_fee;
	public ProductDomain() {
		
	}
	
	
	
	public ProductDomain(String goodsNum, String name, String detail, String quality_code, String category_num,
			String price, String cnt, String trade_method_code, String category, String location,
			String sell_status_code, MultipartFile img, String imgFileName, int mem_num_sell, int delivery_fee) {
		this.goodsNum = goodsNum;
		this.name = name;
		this.detail = detail;
		this.quality_code = quality_code;
		this.category_num = category_num;
		this.price = price;
		this.cnt = cnt;
		this.trade_method_code = trade_method_code;
		this.category = category;
		this.location = location;
		this.sell_status_code = sell_status_code;
		this.img = img;
		this.imgFileName = imgFileName;
		this.mem_num_sell = mem_num_sell;
		this.delivery_fee = delivery_fee;
	}



	public String getGoodsNum() {
		return goodsNum;
	}
	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getQuality_code() {
		return quality_code;
	}
	public void setQuality_code(String quality_code) {
		this.quality_code = quality_code;
	}
	public String getCategory_num() {
		return category_num;
	}
	public void setCategory_num(String category_num) {
		this.category_num = category_num;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCnt() {
		return cnt;
	}
	public void setCnt(String cnt) {
		this.cnt = cnt;
	}
	public String getTrade_method_code() {
		return trade_method_code;
	}
	public void setTrade_method_code(String trade_method_code) {
		this.trade_method_code = trade_method_code;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getsell_status_code() {
		return sell_status_code;
	}
	public void setsell_status_code(String sell_status_code) {
		this.sell_status_code = sell_status_code;
	}
	public MultipartFile getImg() {
		return img;
	}
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public int getmem_num_sell() {
		return mem_num_sell;
	}
	public void setmem_num_sell(int mem_num_sell) {
		this.mem_num_sell = mem_num_sell;
	}
	public int getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	@Override
	public String toString() {
		return "ProductDomain [goodsNum=" + goodsNum + ", name=" + name + ", detail=" + detail + ", quality_code="
				+ quality_code + ", category_num=" + category_num + ", price=" + price + ", cnt=" + cnt
				+ ", trade_method_code=" + trade_method_code + ", category=" + category + ", location=" + location
				+ ", sell_status_code=" + sell_status_code + ", img=" + img + ", imgFileName=" + imgFileName
				+ ", mem_num_sell=" + mem_num_sell + ", delivery_fee=" + delivery_fee + "]";
	}


	
}
