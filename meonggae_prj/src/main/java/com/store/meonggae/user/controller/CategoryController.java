package com.store.meonggae.user.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.RedirectView;

import com.store.meonggae.product.domain.CategoryDomain;
import com.store.meonggae.product.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;

	//전체보기 카테고리(대분류)
		//@ResponseBody json형식으로 변환하여 클라이언트에게 전달.
		@ResponseBody
		@RequestMapping(value="/parentCategory.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
		public String parentCategory() {
			List<CategoryDomain> parentCategory = categoryService.selectParentCategory();
			
			JSONArray jsonArr = new JSONArray();
			for(CategoryDomain category : parentCategory) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("categoryNum", category.getCategoryNum());
				jsonObj.put("name", category.getName());
				jsonObj.put("parentCategoryNum", category.getParentCategoryNum());
				jsonArr.add(jsonObj);
			}//for
			return jsonArr.toJSONString();
		}//parentCategory
		
		//전체보기 카테고리(소분류)
		@ResponseBody
		@RequestMapping(value="/subCategory.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	    public String subCategory(@RequestParam("Category") String parentCategory) {
	        List<CategoryDomain> subCategory = categoryService.selectSubCategory(parentCategory);
	        
	        JSONArray jsonArr = new JSONArray();
			for(CategoryDomain category : subCategory) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("categoryNum", category.getCategoryNum());
				jsonObj.put("name", category.getName());
				jsonObj.put("parentCategoryNum", category.getParentCategoryNum());
				jsonArr.add(jsonObj);
			}//for
	        
	        return jsonArr.toJSONString();
	    }//subCategory
		
		@RequestMapping(value="/isParentCategory.do", method=RequestMethod.GET)
		public RedirectView isParentCategory(@RequestParam("cn") String categoryNum) {
			boolean result = categoryService.isParentCategory(categoryNum);//true면 부모.
			String temp = result ? "T" : "F";
			String redirectUrl = "main_page/search_contents.do?cn=" + categoryNum + "&isP=" + temp;
			return new RedirectView(redirectUrl);
		}
	
}//class
