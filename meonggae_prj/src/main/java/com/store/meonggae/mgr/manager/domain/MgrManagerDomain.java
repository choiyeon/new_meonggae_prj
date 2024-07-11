package com.store.meonggae.mgr.manager.domain;

import java.sql.Date;

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
public class MgrManagerDomain {
	private String managerId, dname, deptno, parentManagerId, parentManagerName, name, birth, nick, gender, email, addr1, addr2, tel, permission;
	private Date inputDate;
	private boolean deleteFlag;
	private Date deleteDate;
}
