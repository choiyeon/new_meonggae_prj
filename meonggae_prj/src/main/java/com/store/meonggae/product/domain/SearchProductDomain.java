package com.store.meonggae.product.domain;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter*/

public class SearchProductDomain {
	private String goodsNum, goodsName, goodsImgNum, imgName, price, priceFm, categoryNum, categoryName, parentCategoryNum, location, locationStr, timeAgo;
	private int memNumSell;
	private Date inputDate;
	
	public SearchProductDomain() {
		
	}

	public SearchProductDomain(String goodsNum, String goodsName, String goodsImgNum, String imgName, String price,
			String priceFm, String categoryNum, String categoryName, String parentCategoryNum, String location,
			String locationStr, String timeAgo, int memNumSell, Date inputDate) {
		super();
		this.goodsNum = goodsNum;
		this.goodsName = goodsName;
		this.goodsImgNum = goodsImgNum;
		this.imgName = imgName;
		this.price = price;
		this.priceFm = priceFm;
		this.categoryNum = categoryNum;
		this.categoryName = categoryName;
		this.parentCategoryNum = parentCategoryNum;
		this.location = location;
		this.locationStr = locationStr;
		this.timeAgo = timeAgo;
		this.memNumSell = memNumSell;
		this.inputDate = inputDate;
	}


	public String getGoodsNum() {
		return goodsNum;
	}

	public void setGoodsNum(String goodsNum) {
		this.goodsNum = goodsNum;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsImgNum() {
		return goodsImgNum;
	}

	public void setGoodsImgNum(String goodsImgNum) {
		this.goodsImgNum = goodsImgNum;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPriceFm() {
		return priceFm;
	}

	public void setPriceFm(String priceFm) {
		this.priceFm = priceFm;
	}

	public String getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getLocationStr() {
		return locationStr;
	}

	public void setLocationStr(String locationStr) {
		this.locationStr = locationStr;
	}

	public String getTimeAgo() {
		return timeAgo;
	}

	public void setTimeAgo(String timeAgo) {
		this.timeAgo = timeAgo;
	}

	public int getMemNumSell() {
		return memNumSell;
	}

	public void setMemNumSell(int memNumSell) {
		this.memNumSell = memNumSell;
	}

	public Date getInputDate() {
		return inputDate;
	}

	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getParentCategoryNum() {
		return parentCategoryNum;
	}

	public void setParentCategoryNum(String parentCategoryNum) {
		this.parentCategoryNum = parentCategoryNum;
	}

	@Override
	public String toString() {
		return "SearchProductDomain [goodsNum=" + goodsNum + ", goodsName=" + goodsName + ", goodsImgNum=" + goodsImgNum
				+ ", imgName=" + imgName + ", price=" + price + ", priceFm=" + priceFm + ", categoryNum=" + categoryNum
				+ ", categoryName=" + categoryName + ", parentCategoryNum=" + parentCategoryNum + ", location="
				+ location + ", locationStr=" + locationStr + ", timeAgo=" + timeAgo + ", memNumSell=" + memNumSell
				+ ", inputDate=" + inputDate + "]";
	}

	
	
}
