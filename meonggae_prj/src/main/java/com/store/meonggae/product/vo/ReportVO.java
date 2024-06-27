package com.store.meonggae.product.vo;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Getter
@Setter
public class ReportVO {
	private int iMemNumRep;
    private String iGoodsNum;
    private String iCategory;
    private String iTitle;
    private String iContents;
    private int cntMem;
    private int cntMgr;
    private String errMsg;
}
