package com.store.meonggae.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.store.meonggae.product.dao.CategoryDAO;
import com.store.meonggae.product.domain.CategoryDomain;

@Service
public class CategoryService {

    @Autowired
    private CategoryDAO cateDAO;
    
    public List<CategoryDomain> selectParentCategory(){
    	return cateDAO.selectCategory("0");
    }
    public List<CategoryDomain> selectSubCategory(String subCategory){
    	return cateDAO.selectCategory(subCategory);
    }
    public boolean isParentCategory(String categoryNum) {
    	return cateDAO.isParentCategory(categoryNum).equals("0");//true면 부모, false면 자식
    }
    

    
}
