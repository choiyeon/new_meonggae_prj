package com.store.meonggae.my.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class InquiryVO {
	
	private int memnum;
	private String title, category, content;
    private int cntMem, cntMgr;
    private String errMsg;

}
