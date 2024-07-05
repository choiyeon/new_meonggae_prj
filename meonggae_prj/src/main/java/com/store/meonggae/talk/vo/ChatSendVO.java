package com.store.meonggae.talk.vo;

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
public class ChatSendVO {
	private String memNumSend, memNumRecv, content;
	private String goodsNum,readFlag;
}

