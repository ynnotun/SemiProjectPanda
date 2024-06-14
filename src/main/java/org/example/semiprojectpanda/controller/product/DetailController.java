package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.WishDto;
import org.example.semiprojectpanda.service.DetailService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class DetailController {
    private final DetailService detailService;

    @GetMapping("/product/detail")
    public String detail(
            @RequestParam("productnum") int productnum,
            HttpServletRequest request,
            Model model
    ) {
        HttpSession session = request.getSession();
        var usernum = session.getAttribute("usernum");
        var productDto = detailService.getProductByProductnum(productnum);
        var userDto = detailService.getUserByUsernum(productDto.getUsernum());
        System.out.println(detailService.getAllProductImages(productnum));
        model.addAttribute("productDto", productDto);
        model.addAttribute("imageDtoList", detailService.getAllProductImages(productnum));
        model.addAttribute("userDto", userDto);
        model.addAttribute("connectedUserNum", usernum);

        return "product/product-detail";
    }

    @GetMapping("/product/wish")
    @ResponseBody
    public Map<String, String> wish(
            @RequestParam("usernum") int usernum,
            @RequestParam("productnum") int productnum
    ) {
        Map<String, String> result = new HashMap<>();
        WishDto wishDto = WishDto.builder()
                .usernum(usernum)
                .productnum(productnum).build();

        int check = detailService.checkWish(wishDto);
        if (check == 0) {
            result.put("status", "wish add");
            detailService.insertWish(wishDto);
        } else {
            result.put("status", "wish delete");
            detailService.deleteWish(wishDto);
        }

        return result;
    }
}
