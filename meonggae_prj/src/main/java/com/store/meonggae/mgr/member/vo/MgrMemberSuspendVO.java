package com.store.meonggae.mgr.member.vo;

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
public class MgrMemberSuspendVO {
	private int memNum;
	private String unsuspendDate, suspendPeriod;
}
