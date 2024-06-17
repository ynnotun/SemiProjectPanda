package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.service.ProductWriteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class WriteController {

    private final ProductWriteService productWriteService;
    private final ProductMapperInter productMapperInter;

    /*
    private String bucketName = "";
    private String folderName = "";

    @Autowired
    private NcpObjectStorageService storageService;
    */

    @GetMapping("/product/write")
    public String productWrite(Model model) {
        // login 상태가 아니라면 등록 글에 접근 못하고 로그인 페이지로 이동하도록

        //CATEGORY 받아와서 나열하기
        List<CategoryDto> categories = productWriteService.getAllCategories();
        model.addAttribute("categories", categories);

        return "product/product-write";
    }

    @PostMapping("/product/write")
    public String submitProduct(
            @ModelAttribute ProductDto productDto,
            /*@RequestParam("images") List<MultipartFile> images,
            @RequestParam("hashtags") List<String> hashtags,*/
            HttpSession session
            )
    {
        /*
        //세션으로부터 로그인한 usernum을 얻음
        int usernum = session.getAttribute("usernum");
        */

        //product에 대한 insert
        productWriteService.insertProduct(productDto);

        //지금 추가된 productnum을 구하기
        int productnum = productDto.getProductnum();
        //System.out.println(productnum);

        //productimage에 대한 insert

        //hashtag에 대한 insert

        return "redirect:/product/detail/?productnum=" + productnum;
    }
}
