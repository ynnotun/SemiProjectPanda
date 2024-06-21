package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.mapperInter.ProductImageMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.example.semiprojectpanda.mapperInter.WishMapperInter;
import org.example.semiprojectpanda.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class MypageController {
    @Autowired
    private UserMapperInter userMapperInter;

    @Autowired
    private ProductService productService;

    @Autowired
    private WishService wishService;

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private DetailService detailService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProductImageMapperInter productImageMapperInter;


    @GetMapping("/mypage")
    public String mypage(@RequestParam int usernum, Model model) {

        UserDto dto = userMapperInter.findByUsernum(usernum);

        /* 판매, 구매, 찜목록 출력*/
        List<ProductDto> sellList = productService.getFourFromSellList(usernum);
        List<ProductDto> buyList = productService.getFourFromBuyList(usernum);
        /*List<ProductDto> wishList = wishService.getThreeFromWishList(usernum);*/
        List<ReviewDto> reviews = reviewService.getReviewsByUsernum(usernum);
        String userGrade = reviewService.getGradeByUsernum(usernum);

        /* 리뷰 개수 출력 */
        int reviewCount = reviewService.getCountReviews(usernum);

        /*  평점 구하기 */
        try {
            Double star = reviewService.getStarByUsernum(usernum);
            if (star == null) {
                model.addAttribute("star", "평점 없음");
            } else {
                model.addAttribute("star", String.format("%.1f", star));
            }
        } catch (NullPointerException e) {

        }
        // 찜목록 사진 출력
        List<ProductDto> wishList = wishService.getThreeFromWishList(usernum);
        for (ProductDto productDto : wishList) {
            List<ProductImageDto> list = productImageMapperInter.findImageByProductnum(productDto.getProductnum());
            productDto.setImagefilename(list.get(0).getImagefilename());
        }

        model.addAttribute("usernum", usernum);
        model.addAttribute("dto", dto);
        model.addAttribute("sellList", sellList);
        model.addAttribute("buyList", buyList);
        model.addAttribute("wishList", wishList);
        model.addAttribute("reviewCount", reviewCount);
        model.addAttribute("reviews", reviews);
        model.addAttribute("userGrade", userGrade);


        return "account/mypage";
    }


    @PostMapping("/mypage/confirm-password")
    @ResponseBody
    public String confirmPassword(@RequestBody Map<String, String> request, HttpSession session) {
        String inputPassword = request.get("password");

        // 세션에서 현재 로그인한 사용자의 usernum 가져오기
        int usernum = (int) session.getAttribute("usernum");

        // 데이터베이스에서 현재 사용자의 비밀번호 가져오기
        String currentUserPassword = userService.getUserPassword(usernum);

        if (inputPassword.equals(currentUserPassword)) {
            return "success";
        } else {
            return "fail";
        }
    }
}


