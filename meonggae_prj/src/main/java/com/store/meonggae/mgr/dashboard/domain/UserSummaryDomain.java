package com.store.meonggae.mgr.dashboard.domain;

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
public class UserSummaryDomain {
	private String item;
	private int cnt_now, cnt_prev;
	private String ratio_change;
	private List<UserGraphDomain> graph;
}
