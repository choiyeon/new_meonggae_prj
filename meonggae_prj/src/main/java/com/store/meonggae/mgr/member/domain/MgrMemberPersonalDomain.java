package com.store.meonggae.mgr.member.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MgrMemberPersonalDomain {
	private int memNum;
	private String memId, name, nick, memStatus, birth, img, ageRange, addr, tel, gender, loginFlag, social;
	private Date joinDate, recentLoginDate, suspendDate, unsuspendDate, withdrawDate;
}
