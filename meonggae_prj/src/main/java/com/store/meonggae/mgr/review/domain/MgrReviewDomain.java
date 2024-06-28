package com.store.meonggae.mgr.review.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MgrReviewDomain {
	private int goodsNum, memNumSell, memNumBuy; 
	private String nickSell, nickBuy, goodsTitle, goodsImg;
	private int categoryNum;
	private String categoryName;
	private int parentCategoryNum;
	private String parentCategoryName, content;
	private int star;
	private boolean deleteFlag;
	private Date reviewInputDate, goodsInputDate, sellDate;
}
