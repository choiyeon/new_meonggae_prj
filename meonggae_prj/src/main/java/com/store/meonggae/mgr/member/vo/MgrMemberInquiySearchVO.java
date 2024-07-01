package com.store.meonggae.mgr.member.vo;

import com.store.meonggae.mgr.common.vo.MgrSearchVO;

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
public class MgrMemberInquiySearchVO extends MgrSearchVO{
	private String startDate, endDate, answerFlag;
	private int memNum;
}
