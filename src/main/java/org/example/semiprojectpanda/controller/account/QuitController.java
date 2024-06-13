package org.example.semiprojectpanda.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class QuitController {
    @GetMapping("/quit")
    public String mypage() {
        return "account/quit";
    }
}
