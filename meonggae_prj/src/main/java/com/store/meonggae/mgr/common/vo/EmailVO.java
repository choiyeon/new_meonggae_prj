package com.store.meonggae.mgr.common.vo;

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
public class EmailVO {
	private int num;
	private String email, subject, content;
	private String senderEmail, senderPassword;
}
