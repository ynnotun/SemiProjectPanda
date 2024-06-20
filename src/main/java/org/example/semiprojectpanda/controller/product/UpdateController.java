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
            @RequestParam("productImages") List<MultipartFile> productImages,
            @RequestParam("hashtaglist") String hashtaglist,
            HttpSession session
    )
    {
        //수정 폼이 제출된 상품의 상품번호
        int productnum = productDto.getProductnum();

        //product에 대한 update
        productUpdateService.updateProduct(productDto);

        //productimage에 대한 update
        //1. 새로운 사진이 업로드된 경우
        if(productImages != null && !productImages.isEmpty())
        {
            //1.1 버켓에 업로드된 기존 이미지 파일들 삭제
            List<ProductImageDto> existImages = productUpdateService.getAllProductImages(productnum);
            for(ProductImageDto existImage : existImages) {
                storageService.deleteFile(bucketName, folderName, existImage.getImagefilename());
            }

            //1.2 prouctimage 테이블에 저장된 기존 이미지 행들 삭제
            productUpdateService.deleteAllProductImages(productnum);

            //1.3 새로 입력된 파일들 버켓에 업로드 + productimage 테이블에 삽입
            for (MultipartFile image : productImages) {
                if (!image.isEmpty()) {
                    String filename = storageService.uploadFile(bucketName, folderName, image);

                    // DB에 이미지 정보 저장
                    ProductImageDto imageDto = new ProductImageDto();
                    imageDto.setProductnum(productnum);
                    imageDto.setImagefilename(filename);
                    productUpdateService.insertProductImage(imageDto);
                }
            }
        }
        // 2. 아무 사진이 업로드 되지 않은 경우
        //수행할 작업 없음

        //hashtag에 대한 insert
        //1. 새로 추가된 해시태그가 있는 경우
        if(hashtaglist != null && !hashtaglist.isEmpty())
        {
            //1.1 기존 해시태그 행들을 해시태그 테이블에서 삭제
            productUpdateService.deleteAllHashtags(productnum);

            //1.2 새로 입력된 해시태그들 해시태그 테이블에 추가
            List<String> hashtags = new ArrayList<>(Arrays.asList(hashtaglist.split(",")));
            for (String tag : hashtags) {
                HashtagDto hashtagDto = new HashtagDto();
                hashtagDto.setProductnum(productnum);
                hashtagDto.setHashtagname(tag);
                productUpdateService.insertHashtag(hashtagDto);
            }
        }
        //2. 해시태그가 아무것도 추가되지 않은 경우
        //수행할 작업 없음

        return "redirect:/product/detail/?productnum=" + productnum;
    }
}
