package org.example.semiprojectpanda.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignUpController {
    @GetMapping("/singup")
    public String login(){
        return "account/singup";
    }
}
