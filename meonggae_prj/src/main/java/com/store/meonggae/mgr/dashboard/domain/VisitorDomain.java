package com.store.meonggae.mgr.dashboard.domain;

import java.util.List;

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
public class VisitorDomain {
	private int userTotalCnt;
	private String userTotalRatioChange;

	private int memberCnt;
	private String memberRatioChange;

	private int nonMemberCnt;
	private String nonMemberRatioChange;
	
	private List<VisitorGraphDomain> graph;
}
