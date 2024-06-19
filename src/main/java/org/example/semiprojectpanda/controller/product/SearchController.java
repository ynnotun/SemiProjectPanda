package org.example.semiprojectpanda.controller.product;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.List;

@Controller
public class SearchController {

    @Autowired
    private ProductService productService;
/*
    @GetMapping("/search")
    public String search(@RequestParam("keyword") String keyword, Model model) {
        // 키워드를 리스트로 변환
        List<String> keywords = Arrays.asList(keyword.split("\\s+"));

        // 키워드 리스트를 사용하여 검색
        List<ProductDto> searchResults = productService.getSearchList(keywords);

        // 검색 결과를 모델에 추가
        model.addAttribute("searchResults", searchResults);
        model.addAttribute("keyword", keyword);
        return "product/product-search"; // 검색 결과를 보여줄 JSP 파일
    }*/
}