package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.example.semiprojectpanda.mapperInter.WishMapperInter;
import org.example.semiprojectpanda.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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


    @GetMapping("/mypage")
    public String mypage(@RequestParam int usernum, Model model) {

        UserDto dto = userMapperInter.findByUsernum(usernum);

        List<ProductDto> sellList = productService.getFourFromSellList(usernum);
        List<ProductDto> buyList = productService.getFourFromBuyList(usernum);
        List<ProductDto> wishList = wishService.getThreeFromWishList(usernum);

        /*  평점 구하기 */
        try {
            String star = reviewService.getStarByUsernum(usernum);
            if(star==null){
                model.addAttribute("star", "평점 없음");
            } else {
                model.addAttribute("star", star);
            }
        } catch (NullPointerException e) {

        }

        model.addAttribute("usernum", usernum);
        model.addAttribute("dto", dto);
        model.addAttribute("sellList", sellList);
        model.addAttribute("buyList", buyList);
        model.addAttribute("wishList", wishList);


        return "account/mypage";
    }
}
