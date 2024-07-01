package com.store.meonggae.mgr.review.vo;

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
public class MgrReviewSearchVO extends MgrSearchVO{
	private String startDate, endDate;
	private String categoryNum, parentCategoryNum;
}
