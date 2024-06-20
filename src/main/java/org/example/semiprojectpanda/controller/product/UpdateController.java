package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.ProductUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class UpdateController {

    private final ProductUpdateService productUpdateService;

    // navercloudplatform
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName = "semi";
    private String folderName = "panda";

    @GetMapping("/product/update")
    public String productUpdate(
            @RequestParam("productnum") int productnum,
            Model model)
    {
        //CATEGORY 받아와서 나열하기
        List<CategoryDto> categories = productUpdateService.getAllCategories();
        model.addAttribute("categories", categories);

        //상품 정보
        ProductDto productDto = productUpdateService.getProductByProductnum(productnum);
        model.addAttribute(productDto);

        //상품 이미지 리스트로
        List<ProductImageDto> productImages = productUpdateService.getAllProductImages(productnum);
        model.addAttribute("productImages", productImages);

        //상품 해시태그 리스트로
        List<HashtagDto> hashtags = productUpdateService.getAllHashtags(productnum);
        model.addAttribute("hashtags", hashtags);

        return "product/product-update";
    }

    @PostMapping("/product/update")
    public String submitProduct(
            @ModelAttribute ProductDto productDto,
            /*@RequestParam("productImages") List<MultipartFile> productImages,*/
            @RequestParam("hashtaglist") String hashtaglist,
            HttpSession session
    )
    {
        //수정 폼이 제출된 상품의 상품번호
        int productnum = productDto.getProductnum();

        //product에 대한 update
        productUpdateService.updateProduct(productDto);

        //업데이트 결과 해시태그 행 삽입
        // 기존 해시태그 업데이트 로직
        if (hashtaglist != null && !hashtaglist.isEmpty()) {
            productUpdateService.deleteAllHashtags(productnum);
            List<String> hashtags = new ArrayList<>(Arrays.asList(hashtaglist.split(",")));
            for (String hashtag : hashtags) {
                HashtagDto hashtagDto = new HashtagDto();
                hashtagDto.setProductnum(productnum);
                hashtagDto.setHashtagname(hashtag);
                productUpdateService.insertHashtag(hashtagDto);
            }
        }

        return "redirect:/product/detail/?productnum=" + productnum;
    }
}
