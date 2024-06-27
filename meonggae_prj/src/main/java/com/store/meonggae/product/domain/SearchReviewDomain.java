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
public class SearchReviewDomain {
	private String buyerNick, goodsNum, buyerImg, content, timeAgoStr;
	private int buyerNum, star;
	private Date inputDate;
}
