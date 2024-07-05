package com.store.meonggae.mng.report.vo;

import java.sql.Date;

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
public class ReportVO {

	private int mem_num_rep;
	private String rep_num, manager_id, goods_num, category, title,
	contents, process_status_code, process_contents;
	private Date input_date, process_date;
	
}
