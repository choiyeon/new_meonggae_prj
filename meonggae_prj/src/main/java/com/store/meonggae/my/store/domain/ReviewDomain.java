package com.store.meonggae.my.store.domain;

public class ReviewDomain {
	
	private String writer, content;
	private int starScore;
	
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
	public int getStarScore() {
		return starScore;
	}
	public void setStarScore(int starScore) {
		this.starScore = starScore;
	}
	@Override
	public String toString() {
		return "ReviewDomain [writer=" + writer + ", content=" + content + ", starScore=" + starScore + "]";
	}
	
}
