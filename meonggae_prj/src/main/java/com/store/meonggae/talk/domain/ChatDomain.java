package com.store.meonggae.talk.domain;

public class ChatDomain {
	private String chatKey;
	private String nick;
	private String profile;
	private String productImg;
	private String productName;
	private int productPrice;
	private String sellStatus;
	private String content;
	private String readFlag;
	private String inputDate;

	public ChatDomain() {
		
	}
	
	
	
	public ChatDomain(String chatKey, String nick, String profile, String productImg, String productName,
			int productPrice, String sellStatus, String content, String readFlag, String inputDate) {
		this.chatKey = chatKey;
		this.nick = nick;
		this.profile = profile;
		this.productImg = productImg;
		this.productName = productName;
		this.productPrice = productPrice;
		this.sellStatus = sellStatus;
		this.content = content;
		this.readFlag = readFlag;
		this.inputDate = inputDate;
	}



	// Getters and Setters
	public String getChatKey() {
		return chatKey;
	}

	public void setChatKey(String chatKey) {
		this.chatKey = chatKey;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getProductImg() {
		return productImg;
	}

	public void setProductImg(String productImg) {
		this.productImg = productImg;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReadFlag() {
		return readFlag;
	}

	public void setReadFlag(String readFlag) {
		this.readFlag = readFlag;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}



	@Override
	public String toString() {
		return "ChatDomain [chatKey=" + chatKey + ", nick=" + nick + ", profile=" + profile + ", productImg="
				+ productImg + ", productName=" + productName + ", productPrice=" + productPrice + ", sellStatus="
				+ sellStatus + ", content=" + content + ", readFlag=" + readFlag + ", inputDate=" + inputDate + "]";
	}
	
	
}
