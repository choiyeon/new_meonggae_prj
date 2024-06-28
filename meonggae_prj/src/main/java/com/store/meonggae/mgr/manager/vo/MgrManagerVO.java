package com.store.meonggae.mgr.manager.vo;

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
public class MgrManagerVO {
	private String managerId, deptno, parentManagerId, pass, name, birth, nick, permission, secondAuthKey;
	private String gender, tel, addr1, addr2, email;
}
