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
                                Model model)
    {
        //리뷰를 남기는 사람은 현재 로그인 중이며 리뷰 작성에 접근한 사용자
        HttpSession session = request.getSession();
        Integer reviewsenduser = (Integer) session.getAttribute("usernum"); // 리뷰를 작성하는 유저 == 로그인중인 유저
        ProductDto productDto = detailService.getProductByProductnum(productnum); // product에 대해 받기
        model.addAttribute("productDto", productDto);
        UserDto sendUserDto = userService.findByUsernum(reviewsenduser);

        model.addAttribute("reviewSendUser", sendUserDto);
        if (reviewsenduser.equals(productDto.getUsernum())) { // 리뷰작성자가 판매자라면?
            UserDto receiveUserDto = userService.findByUsernum(productDto.getCustomernum());
            model.addAttribute("reviewReceiveUser", receiveUserDto);
        } else { // 리뷰 작성자가 구매자라면?
            UserDto receiveUserDto = userService.findByUsernum(productDto.getUsernum());
            model.addAttribute("reviewReceiveUser", receiveUserDto);
        }
        model.addAttribute("reviewsenduser", reviewsenduser);
        model.addAttribute("productnum", productnum);

        return "product/review";
    }

    @PostMapping("/product/review")
    public String submitReview(@ModelAttribute ProductDto productDto,
                               @ModelAttribute ReviewDto reviewDto,
                               HttpServletRequest request)
    {
        //리뷰를 남기는 사람은 현재 로그인 중이며 리뷰 작성에 접근한 사용자
        HttpSession session = request.getSession();
        Integer reviewsenduser = (Integer) session.getAttribute("usernum"); // 리뷰를 작성하는 유저 == 로그인중인 유저

        reviewDto.setReviewsenduser(reviewsenduser);
        reviewDto.setProductnum(productDto.getProductnum());
        reviewDto.setReviewreceiveuser(reviewDto.getReviewreceiveuser());

        reviewWriteService.insertReview(reviewDto);

        return "redirect:/mypage?usernum=" + reviewDto.getReviewsenduser();//리뷰 작성한 사람 기준으로 이동//로그인중인 사람
    }
}
