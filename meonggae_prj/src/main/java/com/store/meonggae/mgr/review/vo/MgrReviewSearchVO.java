package com.store.meonggae.mgr.review.vo;

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
public class MgrReviewSearchVO {
	private int startNum,endNum;
	private String field, keyword, currentPage;
	private String startDate, endDate;
	private String categoryNum, parentCategoryNum;
}
