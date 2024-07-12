package com.store.meonggae.mng.event.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class MngEventDomain {
	private int cnt;
	private String event_num, title, content, img, start_date, end_date, event_status;
}