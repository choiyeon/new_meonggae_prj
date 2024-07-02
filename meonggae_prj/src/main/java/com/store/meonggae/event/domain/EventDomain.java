package com.store.meonggae.event.domain;

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
public class EventDomain {
	private int cnt;
	private String eventNum, title, content, img, start_date, end_date, event_status;
}
