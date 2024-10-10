package org.example.semiprojectpanda;

import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.ProductImageMapperInter;
import org.example.semiprojectpanda.naver.cloud.NaverConfig;
import org.example.semiprojectpanda.service.MainService;
import org.example.semiprojectpanda.service.ProductUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
public class HomeController {
    @Autowired
    private ProductUpdateService productUpdateService;

    @Autowired
    private ProductImageMapperInter productImageMapperInter;

    @Autowired
    private MainService mainService;

    @Autowired
    private NaverConfig naverConfig;

    @GetMapping("/")
    public String home(
            Model model
    ) {
        List<CategoryDto> categories = productUpdateService.getAllCategories();

        model.addAttribute("categories", categories);


        String minioEndpoint = naverConfig.getEndPoint();
        model.addAttribute("MINIO_ENDPOINT", minioEndpoint);

        return "layout/main";
    }

    @GetMapping("/scroll")
    @ResponseBody
    public List<ProductDto> getCategoryProducts(
            @RequestParam int categorynum,
            @RequestParam int page) {

        int perPage = 8; // 한 페이지에 보여줄 아이템 수
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
