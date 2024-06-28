package com.store.meonggae.mgr.goods.domain;

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
public class MgrSellerReviewDomain {
	private int memNumSell, star;
	private String content, img, nick, timeAgo;
}
