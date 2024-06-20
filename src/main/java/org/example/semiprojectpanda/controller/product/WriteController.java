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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class WriteController {

    private final ProductWriteService productWriteService;

    // navercloudplatform
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName = "semi";
    private String folderName = "panda";

    @GetMapping("/product/write")
    public String productWrite(Model model) {
        //CATEGORY 받아와서 나열하기
        List<CategoryDto> categories = productWriteService.getAllCategories();
        model.addAttribute("categories", categories);

        return "product/product-write";
    }

    @PostMapping("/product/write")
    public String submitProduct(
            @ModelAttribute ProductDto productDto,
            @RequestParam("productImages") List<MultipartFile> productImages,
            @RequestParam("hashtaglist") String hashtaglist,
            HttpServletRequest request
            )
    {
        // 로그인한 사용자의 usernum을 productDto에 설정
        HttpSession session = request.getSession();
        var usernum = session.getAttribute("usernum");
        productDto.setUsernum((Integer) usernum);

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
