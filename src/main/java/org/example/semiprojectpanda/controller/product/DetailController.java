package org.example.semiprojectpanda.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DetailController {
    @GetMapping("/product/detail")
    public String detail(
    ) {
        return "detail/detail";
    }
}
