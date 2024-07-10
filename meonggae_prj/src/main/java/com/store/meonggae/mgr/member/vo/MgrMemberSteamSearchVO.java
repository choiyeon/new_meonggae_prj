package com.store.meonggae.mgr.member.vo;

import com.store.meonggae.mgr.common.vo.MgrSearchVO;

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
public class MgrMemberSteamSearchVO extends MgrSearchVO{
	private int memNum; 
}
