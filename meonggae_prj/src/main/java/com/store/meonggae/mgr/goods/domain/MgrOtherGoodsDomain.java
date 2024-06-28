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
public class MgrOtherGoodsDomain {
	private String goodsNum, img;
	private int price;
}
