package org.example.semiprojectpanda.controller.pay;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {

    @GetMapping("/pay")
    public String pay(){return "pay/payment";}
}
