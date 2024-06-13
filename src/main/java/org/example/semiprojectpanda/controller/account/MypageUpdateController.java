package org.example.semiprojectpanda.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageUpdateController {
    @GetMapping("/mypage/update")
    public String mypage() {
        return "account/mypage-update";
    }
}
