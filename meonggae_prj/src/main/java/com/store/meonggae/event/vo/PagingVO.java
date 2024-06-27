package com.store.meonggae.event.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


public class PagingVO {
	private int startPageNum, endPageNum, currentPage, totalCount, pageScale;
	private String field, keyword;
	
	public PagingVO() {
		
	}

	public PagingVO(int startPageNum, int endPageNum, String field, String keyword, int currentPage, int totalCount, int pageScale) {
		this.startPageNum = startPageNum;
		this.endPageNum = endPageNum;
		this.field = field;
		this.keyword = keyword;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.pageScale = pageScale;
	}
	
	
	
	public int getStartPageNum() {
		return startPageNum;
	}

	public void setStartPageNum(int startPageNum) {
		this.startPageNum = startPageNum;
	}

	public int getEndPageNum() {
		return endPageNum;
	}

	public void setEndPageNum(int endPageNum) {
		this.endPageNum = endPageNum;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageScale() {
		return pageScale;
	}

	public void setPageScale(int pageScale) {
		this.pageScale = pageScale;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void calculatePageNumbers() {
		this.startPageNum = this.currentPage * this.pageScale - this.pageScale + 1;
		this.endPageNum = Math.min(this.startPageNum + this.pageScale - 1, this.totalCount);
	}
}
