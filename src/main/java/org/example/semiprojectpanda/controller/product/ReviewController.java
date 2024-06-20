package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.DetailService;
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
    private final DetailService detailService;
    private final UserService userService;

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
        Integer sendusernum = (Integer) session.getAttribute("usernum"); // 리뷰를 작성하는 유저 == 로그인중인 유저
        ProductDto productDto = detailService.getProductByProductnum(productnum); // product에 대해 받기
        Integer receiveusernum;

        model.addAttribute("reviewSendUser", sendusernum);
        if (sendusernum.equals(productDto.getUsernum())) { // 리뷰작성자가 판매자라면?
            model.addAttribute("reviewReceiveUser", productDto.getCustomernum());
            receiveusernum = productDto.getCustomernum();
        } else { // 리뷰 작성자가 구매자라면?
            model.addAttribute("reviewReceiveUser", productDto.getUsernum());
            receiveusernum = productDto.getUsernum();
        }

        UserDto sendUserDto = userService.findByUsernum(sendusernum); // 리뷰 작성자 정보
        UserDto receiveUserDto = userService.findByUsernum(receiveusernum); // 리뷰 대상자 정보
        model.addAttribute("sendUserDto", sendUserDto);
        model.addAttribute("receiveUserDto", receiveUserDto);
        model.addAttribute("productDto", productDto);

        //return "product/product-review/?productnum=" + productnum;
        return "product/product-review";
    }

    @PostMapping("/product/review")
    public String submitReview(@ModelAttribute ProductDto productDto,
                               @ModelAttribute ReviewDto reviewDto,
                               HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        Integer sendusernum = (Integer) session.getAttribute("usernum");
        UserDto userDto = userService.findByUsernum(sendusernum);

        /*
        reviewDto.setReviewsenduser(sendusernum);
        if(sendusernum == productDto.getUsernum())//리뷰 작성자가 판매자인 경우
        {
            reviewDto.setReviewreceiveuser(productDto.getCustomernum());//작성 대상자는 구매자
        }
        else// 리뷰 작성자가 구매자인 경우
        {
            reviewDto.setReviewreceiveuser(productDto.getUsernum());//작성 대상자는 판매자
        }
        reviewDto.setProductnum(productDto.getProductnum());
        */

        reviewWriteService.insertReview(reviewDto);

        return "redirect:/mypage?usernum=" + reviewDto.getReviewsenduser();//리뷰 작성한 사람 기준으로 이동//로그인중인 사람
    }
}
