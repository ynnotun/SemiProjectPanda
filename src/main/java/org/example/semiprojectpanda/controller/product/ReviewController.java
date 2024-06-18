package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.ReviewWriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String productReview(/*@RequestParam int productnum,*/ Model model) {
        //model.addAttribute("productnum", 50);
        return "product/product-review";
    }

    @PostMapping("/product/review")
    public String submitReview(@ModelAttribute ReviewDto reviewDto, Model model) {
        reviewWriteService.insertReview(reviewDto);

        model.addAttribute("message", "Review submitted successfully!");

        return "redirect:/mypage?usernum=" + reviewDto.getReviewsenduser();//리뷰 작성한 사람 기준으로 이동
    }
}
