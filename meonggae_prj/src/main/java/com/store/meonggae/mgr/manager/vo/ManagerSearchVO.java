package com.store.meonggae.mgr.manager.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ManagerSearchVO {
	private int startNum,endNum;
	private String field, keyword, currentPage;
	private List<String> deptno;
}
