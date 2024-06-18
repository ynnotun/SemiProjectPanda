package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.ProductWriteService;
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
public class WriteController {

    private final ProductWriteService productWriteService;

    // navercloud
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName = "semi";
    private String folderName = "panda";

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
            @RequestParam(value = "productImages", required = false) List<MultipartFile> productImages,
            @RequestParam("hashtaglist") String hashtaglist,
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

        //productimage에 대한 insert
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
        }

        //hashtag에 대한 insert
        List<String> hashtags = new ArrayList<>(Arrays.asList(hashtaglist.split(",")));
        for (String tag : hashtags) {
            HashtagDto hashtagDto = new HashtagDto();
            hashtagDto.setProductnum(productnum);
            hashtagDto.setHashtagname(tag);
            productWriteService.insertHashtag(hashtagDto);
        }

        return "redirect:/product/detail/?productnum=" + productnum;
    }
}
