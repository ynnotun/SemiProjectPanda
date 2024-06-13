package org.example.semiprojectpanda.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SearchController {
    @GetMapping("/search") //진짜 주소
    public String search(){
        return "product/product-search"; // JSP 파일 위치
    }
}
