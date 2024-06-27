package com.store.meonggae.mgr.dashboard.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CategoryTopDomain {
	private int totalTradeCnt;
	private List<GoodsTradeRatioDomain> graph;
}
