package com.store.meonggae.mgr.dashboard.vo;

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
public class VisitorDatepickVO {
	private String visitorStartDate, visitorEndDate, visitorSel;
}
