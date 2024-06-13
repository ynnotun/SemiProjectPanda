package org.example.semiprojectpanda.controller.product;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WriteController {
    //콩비 추가 : 24/06/13_12:10 version1
    // /product/write
    @GetMapping("/product/write")
    public String productWrite() {
        return "product/product-write";
    }
}
