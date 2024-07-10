package com.store.meonggae.mgr.common.service;

import java.lang.reflect.Field;

import org.springframework.stereotype.Service;

@Service
public class FilterParamService {
	
	public String generateParam(Object obj) {
		Object value = null;
		StringBuilder sb = new StringBuilder();
		String type = "";
		String name = "";
		try {
			for (Field field : obj.getClass().getDeclaredFields()) {
	            field.setAccessible(true);
	            
				value = field.get(obj); // 필드에 해당하는 값을 가져오기
				type = field.getType().toString();
				name = field.getName();
				
				if(type.equals("int") || type.equals("double") || (value != null && !value.toString().equals(""))) {
					if(!name.equals("startNum") && !name.equals("endNum") && !name.equals("field") && !name.equals("keyword") && !name.equals("currentPage")) {
						sb.append("&").append(name).append("=").append(value);
					} // end if
				} // end if 
	        } // end for
		}catch (Exception e) {
            e.printStackTrace();
		} // end catch
		return sb.toString();
	} // generateParam
} // class
