package com.store.meonggae.mgr.manager.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.NoArgsConstructor;

import java.util.List;

import com.store.meonggae.mgr.common.vo.MgrSearchVO;

import lombok.AllArgsConstructor;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ManagerSearchVO extends MgrSearchVO{
	private List<String> deptno;
}
