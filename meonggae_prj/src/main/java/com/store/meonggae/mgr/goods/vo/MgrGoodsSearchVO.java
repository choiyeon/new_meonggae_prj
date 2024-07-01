package com.store.meonggae.mgr.goods.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.List;

import com.store.meonggae.mgr.common.vo.MgrSearchVO;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MgrGoodsSearchVO extends MgrSearchVO {
	private String startDate, endDate;
	private String categoryNum, parentCategoryNum;
	private String tradeMethodCode, qualityCode, sellStatusCode; 
	private String location;
	private String minPrice, maxPrice; 
}
