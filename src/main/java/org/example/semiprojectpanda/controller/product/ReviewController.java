package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.ReviewWriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewWriteService reviewWriteService;

    // navercloud
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName = "semi";
    private String folderName = "panda";

    //리뷰 작성버튼을 누르면 해당 상품의 리뷰 페이지로 이동 //아직 매핑 안됨!!!!!!
    // /product/review?reviewreceiveuser=123&reviewsenduser=123&productnum=123
    @GetMapping("/product/review")
    public String productReview(ProductDto productDto) {
        return "product/product-review";
    }






}
