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
        List<ProductDto> products = mainService.getProductsByPage(0,8);

        for (ProductDto product : products) {
            List<ProductImageDto> list = productImageMapperInter.findImageByProductnum(product.getProductnum());
            product.setImagefilename(list.get(0).getImagefilename());
        }

        model.addAttribute("categories", categories);
        model.addAttribute("products", products);
        return "layout/main";
    }
/*
    @GetMapping("/getList")
    @ResponseBody
    public List<ProductDto> getList(int pagenum, int endnum){
        return mainService.getProductsByPage(pagenum,endnum);
    }*/
}
