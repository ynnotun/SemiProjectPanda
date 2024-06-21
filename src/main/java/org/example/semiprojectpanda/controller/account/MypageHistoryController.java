package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.WishDto;
import org.example.semiprojectpanda.service.ProductService;
import org.example.semiprojectpanda.service.UserService;
import org.example.semiprojectpanda.service.WishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class MypageHistoryController {
    @Autowired
    private ProductService productService; //controller에서 ProductService를 사용하겠따

    @Autowired // 매번 넣어주기
    private WishService wishService;
    @Autowired
    private UserService userService;

    @GetMapping("/mypage/history") //진짜 주소
    public String mypageHistory(@RequestParam int usernum,
                                @RequestParam(defaultValue = "sell") String listname,
                                Model model) {
        String usernickname = userService.findByUsernum(usernum).getUsernickname();

        model.addAttribute("usernum", usernum);
        model.addAttribute("usernickname", usernickname);
        model.addAttribute("listname", listname);
        return "account/mypage-history"; // JSP 파일 위치
    }

    //판매내역
    @GetMapping("/getsell")
    @ResponseBody //ajax를 쓸 때 사용하는 어노테이션 (json 형식으로 받아온다)
    public List<ProductDto> getSell(
            @RequestParam int usernum
    ) {

        return productService.getSellList(usernum);
    }

    //구매내역
    @GetMapping("/getbuy")
    @ResponseBody //ajax를 쓸 때 사용하는 어노테이션 (json 형식으로 받아온다)
    public List<ProductDto> getBuy(
            @RequestParam int customernum
    ) {

        return productService.getBuyList(customernum);
    }

    //찜목록
    @GetMapping("/getwish")
    @ResponseBody //ajax를 쓸 때 사용하는 어노테이션 (json 형식으로 받아온다)
    public List<ProductDto> getWishList(
            @RequestParam int usernum
    ) {
        System.out.println(wishService.getWishList(usernum));
        return wishService.getWishList(usernum);
    }
}


