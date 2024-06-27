package com.store.meonggae.mgr.dashboard.domain;

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
public class TopEventDomain {
	private int rnum;
	private String title, dateStart, dateEnd;
	private int cnt;
}
