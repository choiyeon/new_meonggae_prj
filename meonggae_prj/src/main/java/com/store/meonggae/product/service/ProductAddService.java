package com.store.meonggae.product.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.store.meonggae.product.dao.ProductAddDAO;
import com.store.meonggae.product.domain.ProductDomain;

@Service
public class ProductAddService {

    @Autowired
    private ProductAddDAO praDAO;


    public List<ProductDomain> selectProductByUser(int memNum) {
        return praDAO.selectProductByUser(memNum);
    }
    
    // 상품 등록 서비스 메서드 (이미지 파일 포함)
    	public boolean insertProduct(ProductDomain product) throws IOException {
        // 상품 정보를 DB에 저장
        int result = praDAO.insertProduct(product);

        // 상품 이미지 정보를 DB에 저장 (필요시 구현)
        int result2 = praDAO.insertProductImg(product);
        boolean resultFlag = false;
        if(result==1 && result2==1) {
        	resultFlag = true;
        }
        return resultFlag;
    }


    //상품 추가
    public void updateProduct(ProductDomain product) throws IOException {
        praDAO.updateProduct(product);
    }
    //상품 삭제
    public void deleteProduct(ProductDomain product) throws IOException {
    	praDAO.deleteProduct(product);
    }
    
    public String getUerIp(HttpServletRequest request){
    	String ip = request.getHeader("X-FORWARDED-FOR");
    	//PROXY 환경일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("Proxy-Client-IP");
        }

        //웹로직 서버일 경우
        if (ip == null || ip.length() == 0) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }

        if (ip == null || ip.length() == 0) {
            ip = request.getRemoteAddr();
        }
        // 다른 서버 환경일 경우
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        // IPv6 로컬호스트를 IPv4로 변환
        if ("0:0:0:0:0:0:0:1".equals(ip)) {
            ip = "127.0.0.1";
        }
        
    	return ip;
    	
    }

    
   

//    public void insertProduct(ProductDomain product, MultipartFile image) throws IOException {
//        // 파일 업로드 처리
//        if (!image.isEmpty()) {
//            String originalFilename = image.getOriginalFilename();
//            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
//            String storedFilename = UUID.randomUUID().toString() + fileExtension;
//            Path filePath = Paths.get(UPLOAD_DIR, storedFilename);
//
//            // 디렉토리가 없으면 생성
//            if (!Files.exists(filePath.getParent())) {
//                Files.createDirectories(filePath.getParent());
//            }
//
//            // 파일 저장
//            image.transferTo(filePath.toFile());
//
//            // DB에 저장할 파일 경로 설정
//            product.setImg(storedFilename);
//        }
//
//        // 상품 정보를 DB에 저장
//        praDAO.insertProduct(product);
//
//        // 상품 이미지 정보를 DB에 저장
//        praDAO.insertProductImg(product);
//    }
}