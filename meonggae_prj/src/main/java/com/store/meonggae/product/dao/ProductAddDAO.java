package com.store.meonggae.product.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.store.meonggae.dao.MybatisDAO;
import com.store.meonggae.product.domain.BuyerDomain;
import com.store.meonggae.product.domain.ProductDomain;

@Component
public class ProductAddDAO {

    @Autowired
    private MybatisDAO mbDAO;

    public List<ProductDomain> selectProductByUser(int memNum) throws PersistenceException {
        try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
            return ss.selectList("com.store.meonggae.product.selectProductByUser", memNum);
        }
    }

    public int insertProduct(ProductDomain product) {
        try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
            int result = ss.insert("com.store.meonggae.product.insertProduct", product);
            return result;
        }
    }

    public int insertProductImg(ProductDomain product) {
        try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
        	int result = ss.insert("com.store.meonggae.product.insertProductImg", product);
             return result;
        }
    }

    public void updateProduct(ProductDomain product) {
        try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
            ss.update("com.store.meonggae.product.updateProduct", product);
        }catch (PersistenceException e) {
        	e.printStackTrace();
		}
    }
    public void deleteProduct(ProductDomain product) {
    	try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
    		ss.update("com.store.meonggae.product.deleteProduct", product);
    	}catch (PersistenceException e) {
    		e.printStackTrace();
    	}
    }
    //상품 판매
    public void buyProduct(ProductDomain product) {
    	try (SqlSession ss = mbDAO.getMyBatisHandler(true)) {
    		ss.update("com.store.meonggae.product.buyProduct", product);
    	}catch (PersistenceException e) {
    		e.printStackTrace();
    	}
    }
    //판매자 선택
    public List<BuyerDomain> checkBuyer(String goodsNum) throws PersistenceException {
    	try (SqlSession ss = mbDAO.getMyBatisHandler(false)) {
    		return ss.selectList("com.store.meonggae.product.checkBuyer", goodsNum);
    	}
    }
}