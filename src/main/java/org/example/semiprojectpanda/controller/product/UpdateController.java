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

import javax.servlet.http.HttpServletRequest;
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
            Model model,
            HttpSession session)
    {
        var usernum = session.getAttribute("usernum");
        if (usernum == null) {
            return "redirect:/"; // 메인 페이지로 리다이렉트
        }

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
            @RequestParam(value = "deletedImages", required = false) String deletedImagesJson,
            @RequestParam("hashtaglist") String hashtaglist,
            HttpSession session
    )
    {
        var usernum = session.getAttribute("usernum");
        if (usernum == null) {
            return "redirect:/"; // 메인 페이지로 리다이렉트
        }
        //수정 폼이 제출된 상품의 상품번호
        int productnum = productDto.getProductnum();

        // product에 대한 update
        productUpdateService.updateProduct(productDto);

        /*// 삭제된 이미지 처리
        if (deletedImagesJson != null && !deletedImagesJson.isEmpty()) {
            List<String> deletedImages = Arrays.asList(deletedImagesJson.replace("[", "").replace("]", "").replace("\"", "").split(","));
            for (String imageName : deletedImages) {
                // 버켓에서 이미지 삭제
                storageService.deleteFile(bucketName, folderName, imageName.trim());
                // DB에서 이미지 행 삭제
                productUpdateService.deleteProductImageByFilename(imageName.trim());
            }
        }

        // 새로운 이미지 파일이 업로드된 경우 처리
        if (!productImages.isEmpty() && productImages.get(0).getSize() > 0) {
            // 기존 이미지 삭제
            List<ProductImageDto> existingImages = productUpdateService.getAllProductImages(productnum);
            for (ProductImageDto image : existingImages) {
                storageService.deleteFile(bucketName, folderName, image.getImagefilename());
                productUpdateService.deleteProductImageByFilename(image.getImagefilename());
            }

            // 새로 입력된 파일들 버켓에 업로드 + productimage 테이블에 삽입
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
        */

        // 삭제된 이미지 처리
        if (deletedImagesJson != null && !deletedImagesJson.isEmpty()) {
            List<String> deletedImages = Arrays.asList(deletedImagesJson.replace("[", "").replace("]", "").replace("\"", "").split(","));
            for (String imageName : deletedImages) {
                // 버켓에서 이미지 삭제
                storageService.deleteFile(bucketName, folderName, imageName.trim());
                // DB에서 이미지 행 삭제
                productUpdateService.deleteProductImageByFilename(imageName.trim());
            }
        }

        // 새로운 이미지 파일이 업로드된 경우 처리
        if (!productImages.isEmpty() && productImages.get(0).getSize() > 0) {
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

        if(hashtaglist.isEmpty())//해시태그를 다 지워서 제출한 경우?
        {
            productUpdateService.deleteAllHashtags(productnum);
        }
        else
        {
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
