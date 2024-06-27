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
	private String managerId, dname, parentManagerId, name, birth, nick, permission;
	private Date inputDate;
}
