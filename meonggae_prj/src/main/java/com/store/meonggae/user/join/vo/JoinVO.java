package com.store.meonggae.user.join.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class JoinVO {
	//MEMBER
	private String nick;
	//MEMBER_DETAIL
	private String memId, pass, birth, addr, addrDetail, tel, gender, name;
	

}
