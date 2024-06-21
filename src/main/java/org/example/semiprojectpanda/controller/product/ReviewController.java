package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.DetailService;
import org.example.semiprojectpanda.service.ReviewService;
import org.example.semiprojectpanda.service.ReviewWriteService;
import org.example.semiprojectpanda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewWriteService reviewWriteService;
    private final UserService userService;
    private final DetailService detailService;

    // navercloud
    /*
    @Autowired
    private NcpObjectStorageService storageService;
    private String bucketName = "semi";
    private String folderName = "panda";
    */

    //리뷰 작성버튼을 누르면 해당 상품의 리뷰 페이지로 이동
    @GetMapping("/product/review")
    public String productReview(@RequestParam int productnum,
                                HttpServletRequest request,
                                Model model) {
        //리뷰를 남기는 사람은 현재 로그인 중이며 리뷰 작성에 접근한 사용자
        HttpSession session = request.getSession();
        Integer reviewsenduser = (Integer) session.getAttribute("usernum");
        if (reviewsenduser == null) {
            return "redirect:/login";
        }

        model.addAttribute("productnum", productnum);
        return "product/product-review";
    }

    @PostMapping("/product/review")
    public String submitReview(
            @RequestParam int productnum,
            @RequestParam String reviewcontent,
            @RequestParam int reviewstar,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        Integer reviewsenduser = (Integer) session.getAttribute("usernum");
        if (reviewsenduser == null) {
            return "redirect:/login";
        }

        ProductDto productDto = detailService.getProductByProductnum(productnum);

        // 제품이 null인지 확인
        if (productDto == null) {
            return "redirect:/";
        }
        // 제품 상태가 "거래 완료"인지 확인
        if (!productDto.getProductstatus().equals("거래 완료")) {
            return "redirect:/";
        }
        // 리뷰 작성자와 제품 판매자/구매자가 일치하는지 확인
        if (productDto.getUsernum() != reviewsenduser || productDto.getCustomernum() != reviewsenduser) {
            return "redirect:/";
        }

        ReviewDto reviewDto = new ReviewDto();
        reviewDto.setProductnum(productnum);
        reviewDto.setReviewcontent(reviewcontent);
        reviewDto.setReviewstar(reviewstar);
        reviewDto.setReviewsenduser(reviewsenduser);
        int reviewreceiveuser;
        if (productDto.getUsernum() == reviewsenduser) {
            reviewreceiveuser = productDto.getCustomernum();
        } else {
            reviewreceiveuser = productDto.getUsernum();
        }
        reviewDto.setReviewreceiveuser(reviewreceiveuser);

        reviewWriteService.insertReview(reviewDto);

        return "redirect:/mypage?usernum=" + reviewsenduser;
    }
}
