package com.store.meonggae.product.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductDomain {
	private String goodsNum, name, detail, quality_code, category_num, price, cnt, trade_method_code, category, location, sell_status_code;
	private String img, ip;
	private int mem_num_sell, mem_num_buy, delivery_fee;
}
