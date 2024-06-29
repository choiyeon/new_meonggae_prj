package com.store.meonggae.mgr.member.vo;

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
public class MgrMemberReviewSearchVO {
	private int startNum,endNum;
	private String field, keyword, currentPage;
	private String startDate, endDate;
	private int memNum;
}
