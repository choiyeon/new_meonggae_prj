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
public class MgrMemberSteamDomain {
	private String goodsNum,title,img,steamFlag;
	private int price;
	private String timeAgo;
	private Date inputDate;
}
