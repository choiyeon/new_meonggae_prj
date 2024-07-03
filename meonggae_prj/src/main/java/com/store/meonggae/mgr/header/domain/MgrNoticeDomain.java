package com.store.meonggae.mgr.header.domain;

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
public class MgrNoticeDomain {
	private String noticeType, noticeNum, title, timeAgo, noticeReadFlag;
}
