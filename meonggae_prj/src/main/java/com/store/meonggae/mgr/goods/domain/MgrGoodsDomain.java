package com.store.meonggae.mgr.goods.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MgrGoodsDomain {
	private int goodsNum, price, categoryNum, parentCategoryNum, qualityCode, memNumSell, memNumBuy, deliveryFee, steamCnt, cnt;
	private String title, detail, location, img, timeAgo, tradeMethodCode, sellStatusCode, nickSell, nickBuy, profileImg;
	private Date inputDate;
	private boolean flagDelete;
}
