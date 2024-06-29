package com.store.meonggae.mgr.member.vo;

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
public class MgrMemberSteamSearchVO {
	private int startNum,endNum;
	private String field, keyword, currentPage;
	private int memNum; 
}
