package com.store.meonggae.user.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.nio.file.Files;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.store.meonggae.product.domain.BuyerDomain;
import com.store.meonggae.product.domain.ProductDomain;
import com.store.meonggae.product.service.ProductAddService;
import com.store.meonggae.user.login.domain.LoginDomain;

@Controller
public class ProductController {

    @Autowired
    private ProductAddService productAddService;

    @GetMapping("/product_page/product_add.do")
    public String productAdd(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	LoginDomain loginUser = (LoginDomain) session.getAttribute("user");
        // 사용자 정보를 세션에서 가져옴

        if (loginUser != null) {
            int memNum = loginUser.getMemNum();
            List<ProductDomain> productList = productAddService.selectProductByUser(memNum);
            model.addAttribute("productList", productList);
            model.addAttribute("user", loginUser);
            model.addAttribute("memNum", loginUser.getMemNum());
            return "product_page/product_add";
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
            return "redirect:/index.do";
        }
    }

    @RequestMapping(value = "/product_page/product_add.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public String handleProductAdd(Model model, ProductDomain product, HttpSession session, RedirectAttributes redirectAttributes, HttpServletRequest request) throws IOException {
        // 사용자 정보를 세션에서 가져옴
        LoginDomain loginUser = (LoginDomain) session.getAttribute("user");

        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
            return "redirect:/index.do";
        }

        
        
        File saveDir = new File("C:/Users/user/git/new_meonggae_prj/meonggae_prj/src/main/webapp/products-img");
        int maxSize = 10*1024*1024;
        MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(), maxSize, "UTF-8", new DefaultFileRenamePolicy());
        
        // 사용자 정보 설정
        product.setMem_num_sell(loginUser.getMemNum());
        product.setName(mr.getParameter("name"));
        product.setDetail(mr.getParameter("detail"));
        product.setQuality_code(mr.getParameter("quality_code"));
        product.setCategory_num(mr.getParameter("category_num"));
        product.setPrice(mr.getParameter("price"));
        product.setTrade_method_code(mr.getParameter("trade_method_code"));
        product.setLocation(mr.getParameter("location"));
        product.setSell_status_code(mr.getParameter("sell_status_code"));
        product.setDelivery_fee(Integer.parseInt( mr.getParameter("deliver_fee")));
    
        // 파일 업로드 처리
        	// 파일의 원본 이름 가져오기
            String originalFilename = mr.getOriginalFileName("img");
            // 파일 확장자 추출
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
            // 고유한 파일 이름 생성
            String storedFilename = UUID.randomUUID().toString() + fileExtension;
            // 파일 저장 경로 설정
            Path filePath = Paths.get("C:/Users/user/git/new_meonggae_prj/meonggae_prj/src/main/webapp/products-img", storedFilename);

//          디렉토리가 없으면 생성
          if (!Files.exists(filePath.getParent())) {
              Files.createDirectories(filePath.getParent());
          }

          // 파일 저장
          Files.copy(mr.getFile("img").toPath(), filePath);
          
          product.setImg(storedFilename);

        // 상품 등록 서비스 호출
        String userIp = productAddService.getUerIp(request);
        product.setIp(userIp);
        boolean uploadFlag = productAddService.insertProduct(product);
        
        // 모델에 필요한 정보 추가
        model.addAttribute("uploadFlag", uploadFlag);

        return "product_page/product_add";
    }//handleProductAdd
    
	
	  @GetMapping("/product_page/tab01.do") public String productAdd() { // 사용자 정보를

	  return "product_page/tab01";
	  
	  
	  }
    
    @GetMapping("/product_page/tab02.do")
    public String productDetail(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
    	LoginDomain loginUser = (LoginDomain) session.getAttribute("user");
        // 사용자 정보를 세션에서 가져옴

        if (loginUser != null) {
            int memNum = loginUser.getMemNum();
            List<ProductDomain> productList = productAddService.selectProductByUser(memNum);
            model.addAttribute("productList", productList);
            model.addAttribute("user", loginUser);
            model.addAttribute("memNum", loginUser.getMemNum());
            return "product_page/tab02";
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
            return "redirect:/index.do";
        }
    	
    }
    
    @PostMapping("/product_page/product_update.do")
    public String updateProduct(
            @RequestParam("goodsNum") String goodsNum,
            @RequestParam("sell_status_code") String sell_status_code,
            @RequestParam("name") String name,
            @RequestParam("price") String price,
            @RequestParam("location") String location,
            HttpSession session,
            RedirectAttributes redirectAttributes) throws IOException {
        
        LoginDomain loginUser = (LoginDomain) session.getAttribute("user");

        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
            return "redirect:/index.do";
        }

        ProductDomain product = new ProductDomain();
        product.setGoodsNum(goodsNum);
        product.setSell_status_code(sell_status_code);
        product.setName(name);
        product.setPrice(price);
        product.setLocation(location);

        productAddService.updateProduct(product);

        return "redirect:/product_page/tab01.do";
    }
    @PostMapping("/product_page/product_delete.do")
    public String deleteProduct(
    		@RequestParam("goodsNum") String goodsNum,
    		@RequestParam("sell_status_code") String sell_status_code,
    		@RequestParam("name") String name,
    		@RequestParam("price") String price,
    		@RequestParam("location") String location,
    		HttpSession session,
    		RedirectAttributes redirectAttributes) throws IOException {
    	
    	LoginDomain loginUser = (LoginDomain) session.getAttribute("user");
    	
    	if (loginUser == null) {
    		redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
    		return "redirect:/index.do";
    	}
    	
    	ProductDomain product = new ProductDomain();
    	product.setGoodsNum(goodsNum);
    	productAddService.deleteProduct(product);
    	
    	return "redirect:/product_page/tab01.do";
    }
    
    //판매자 선택
 	@GetMapping("/product_page/check_buyer.do")
 	public String checkBuyer(@RequestParam("goodsNum") String goodsNum, Model model) {
 		List<BuyerDomain> buyerList = productAddService.checkBuyer(goodsNum);
 		model.addAttribute("buyerList",buyerList);

 		return "product_page/check_buyer";
 	}

 	//구매 완료 하기
 	@PostMapping("/product_page/product_buy.do")
 	public String buyProduct(
 			@RequestParam("goodsNum") String goodsNum,
 			@RequestParam("buyer") String buyer,
 			HttpSession session,
 			RedirectAttributes redirectAttributes) throws IOException {
 		LoginDomain loginUser = (LoginDomain) session.getAttribute("user");
 		
 		if (loginUser == null) {
 			redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
 			return "redirect:/index.do";
 		}
 		
 		ProductDomain product = new ProductDomain();
 		product.setGoodsNum(goodsNum);
 		int buyerNum = Integer.parseInt(buyer);
 		product.setMem_num_buy(buyerNum);
 		System.out.println(product);
 		productAddService.buyProduct(product);
 		
 		return "redirect:/product_page/tab01.do";
 	}
    
}