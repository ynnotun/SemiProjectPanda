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
import org.springframework.web.multipart.MultipartFile;

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
            @RequestParam(value = "productImages", required = false) List<MultipartFile> productImages,
            @RequestParam("hashtaglist") String hashtaglist,
            HttpSession session
    )
    {
        //product에 대한 insert
        productUpdateService.updateProduct(productDto);

        //지금 추가된 productnum을 구하기
        int productnum = productDto.getProductnum();

        /*//productimage에 대한 insert
        if (productImages != null && !productImages.isEmpty()) {
            for (MultipartFile image : productImages) {
                if (!image.isEmpty()) {
                    String filename = storageService.uploadFile(bucketName, folderName, image);

                    // DB에 이미지 정보 저장
                    ProductImageDto imageDto = new ProductImageDto();
                    imageDto.setProductnum(productnum);
                    imageDto.setImagefilename(filename);
                    productWriteService.insertProductImage(imageDto);
                }
            }
        }*/

        /*//hashtag에 대한 insert
        List<String> hashtags = new ArrayList<>(Arrays.asList(hashtaglist.split(",")));
        for (String tag : hashtags) {
            HashtagDto hashtagDto = new HashtagDto();
            hashtagDto.setProductnum(productnum);
            hashtagDto.setHashtagname(tag);
            productWriteService.insertHashtag(hashtagDto);
        }*/

        return "redirect:/product/detail/?productnum=" + productnum;
    }



}
