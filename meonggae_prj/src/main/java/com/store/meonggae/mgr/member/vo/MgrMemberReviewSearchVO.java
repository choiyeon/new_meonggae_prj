package com.store.meonggae.mgr.member.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import com.store.meonggae.mgr.common.vo.MgrSearchVO;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MgrMemberReviewSearchVO extends MgrSearchVO {
	private String startDate, endDate;
	private int memNum;
}
