package com.store.meonggae.event.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter*/
public class EventDomain {
	private int cnt;
	private String eventNum, title, writer, content, start_date, end_date, img, eventStatus;
	
	public EventDomain() {
		
	}
	
	public EventDomain(int cnt, String eventNum, String title, String writer, String content, String start_date,
			String end_date, String img, String eventStatus) {
		this.cnt = cnt;
		this.eventNum = eventNum;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.start_date = start_date;
		this.end_date = end_date;
		this.img = img;
		this.eventStatus = eventStatus;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getEventNum() {
		return eventNum;
	}
	public void setEventNum(String eventNum) {
		this.eventNum = eventNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getEventStatus() {
		return eventStatus;
	}

	public void setEventStatus(String eventStatus) {
		this.eventStatus = eventStatus;
	}

	@Override
	public String toString() {
		return "EventDomain [cnt=" + cnt + ", eventNum=" + eventNum + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", start_date=" + start_date + ", end_date=" + end_date + ", img=" + img + "eventStatus=" + eventStatus
				+ "]";
	}
	
	
	
}
