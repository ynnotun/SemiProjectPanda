package org.example.semiprojectpanda.controller.account;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
@RequiredArgsConstructor
public class SeachPasswordController {
    @GetMapping("/seachpassword")
    public String login(){
        return "account/seachpassword";
    }
}
