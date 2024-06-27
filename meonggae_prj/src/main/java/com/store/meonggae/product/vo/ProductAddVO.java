package com.store.meonggae.product.vo;

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
public class ProductAddVO {
	private int mem_num_sell, mem_num_buy;
	
	public ProductAddVO() {
		
	}

	public ProductAddVO(int mem_num_sell, int mem_num_buy) {
		this.mem_num_sell = mem_num_sell;
		this.mem_num_buy = mem_num_buy;
	}

	public int getMem_num_sell() {
		return mem_num_sell;
	}

	public void setMem_num_sell(int mem_num_sell) {
		this.mem_num_sell = mem_num_sell;
	}

	public int getMem_num_buy() {
		return mem_num_buy;
	}

	public void setMem_num_buy(int mem_num_buy) {
		this.mem_num_buy = mem_num_buy;
	}

	@Override
	public String toString() {
		return "ProductAddVO [mem_num_sell=" + mem_num_sell + ", mem_num_buy=" + mem_num_buy + "]";
	}
	
	
}
