package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.DetailService;
import org.example.semiprojectpanda.service.ReviewWriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewWriteService reviewWriteService;
    private final DetailService detailService;

    // navercloud
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName = "semi";
    private String folderName = "panda";

    //리뷰 작성버튼을 누르면 해당 상품의 리뷰 페이지로 이동
    @GetMapping("/product/review")
    public String productReview(@RequestParam int productnum,
                                HttpServletRequest request,
                                Model model) {
        ProductDto productDto = detailService.getProductByProductnum(productnum);
        model.addAttribute("productDto", productDto);

        return "product/product-review/?productnum=" + productnum;
    }

    @PostMapping("/product/review")
    public String submitReview(@ModelAttribute ReviewDto reviewDto, Model model) {
        reviewWriteService.insertReview(reviewDto);

        model.addAttribute("message", "Review submitted successfully!");

        return "redirect:/mypage?usernum=" + reviewDto.getReviewsenduser();//리뷰 작성한 사람 기준으로 이동
    }
}
