package com.store.meonggae.user.contoller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
            System.out.println(productList);
            model.addAttribute("productList", productList);
            model.addAttribute("user", loginUser);
            model.addAttribute("memNum", loginUser.getMemNum());
            return "product_page/product_add";
        } else {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
            return "redirect:/index.do";
        }
    }

    @PostMapping("/product_page/product_add.do")
    public String handleProductAdd(Model model, ProductDomain product, MultipartFile img, HttpSession session, RedirectAttributes redirectAttributes) throws IOException {
        // 사용자 정보를 세션에서 가져옴
        LoginDomain loginUser = (LoginDomain) session.getAttribute("user");

        if (loginUser == null) {
            redirectAttributes.addFlashAttribute("message", "로그인이 필요한 서비스 입니다.");
            return "redirect:/index.do";
        }

        // 사용자 정보 설정
        System.out.println("memNum "+loginUser.getMemNum());
        product.setmem_num_sell(loginUser.getMemNum());
        if (img == null || img.isEmpty()) {
            model.addAttribute("uploadFlag", false);
            model.addAttribute("message", "이미지 파일이 필요합니다.");
            return "product_page/product_add";
        }

        // 상품 등록 서비스 호출
        System.out.println(product.toString());
        productAddService.insertProduct(product, img);

        // 모델에 필요한 정보 추가
        model.addAttribute("uploadFlag", true);

        return "product_page/product_add";
    }
    
	
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
            System.out.println(productList);
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

        System.out.println("Received update request: goodsNum=" + goodsNum + ", sellStatusCode=" + sell_status_code
                + ", name=" + name + ", price=" + price + ", location=" + location);

        ProductDomain product = new ProductDomain();
        product.setGoodsNum(goodsNum);
        product.setsell_status_code(sell_status_code);
        product.setName(name);
        product.setPrice(price);
        product.setLocation(location);

        productAddService.updateProduct(product);

        return "redirect:/product_page/tab01.do";
    }

    
}