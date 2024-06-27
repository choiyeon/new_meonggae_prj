package com.store.meonggae.product.domain;


import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class SearchProductDetailDomain {
	private String goodsNum, goodsName, goodsImgNum, imgName, detail, price, priceFm, categoryNum, categoryName, parentCategoryNum, location, locationStr, 
	timeAgo, tradeMethodCode, tradeMethodCodeStr, qualityCode, qualityCodeStr;
	private int memNumSell, cnt, deliveryFee, countSteam;
	private Date inputDate;
}
