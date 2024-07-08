package com.store.meonggae.mng.inquiry.domain;

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
public class MngInquiryDomain {

	private int mem_num;
	private String inquiry_num, inquiry_category_num,
	title, contents, answer_manager_id, answer_contents;
	private Date input_date, answer_date, delete_date;
	private boolean answer_flag, delete_flag;
}
