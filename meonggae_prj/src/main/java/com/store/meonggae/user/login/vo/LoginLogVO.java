package com.store.meonggae.user.login.vo;

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
public class LoginLogVO {
	private int memNum;
	private String ip, os, browser, memStatus;
}
