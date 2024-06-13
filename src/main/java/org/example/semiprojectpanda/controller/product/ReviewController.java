package org.example.semiprojectpanda.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ReviewController {
    //콩비 추가 : 24/06/13_12:10 version1
    // /product/review?reviewreceiveuser=123&reviewsenduser=123&productnum=123
    @GetMapping("/product/review")
    public String productReview() {
        return "product/product-review";
    }
}
