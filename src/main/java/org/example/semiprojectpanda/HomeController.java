package org.example.semiprojectpanda;

import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;
import org.example.semiprojectpanda.mapperInter.CategoryMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductImageMapperInter;
import org.example.semiprojectpanda.service.MainService;
import org.example.semiprojectpanda.service.ProductUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;


@Controller
public class HomeController {
    @Autowired
    private ProductUpdateService productUpdateService;

    @Autowired
    private ProductImageMapperInter productImageMapperInter;

    @Autowired
    private MainService mainService;

    @GetMapping("/")
    public String home(
            Model model
    ) {
        List<CategoryDto> categories = productUpdateService.getAllCategories();

        model.addAttribute("categories", categories);
        return "layout/main";
    }

    @GetMapping("/scroll")
    @ResponseBody
    public List<ProductDto> getCategoryProducts(
            @RequestParam int categorynum,
            @RequestParam int page) {

        int perPage = 4; // 한 페이지에 보여줄 아이템 수
        int start = (page - 1) * perPage;

        List<ProductDto> products = null;
        if (categorynum == 0){
            products = mainService.getAllProducts(start, perPage);
        } else {
            products = mainService.getAllProductsByCategorynum(categorynum, start, perPage);
        }

        return products;
    }
}
