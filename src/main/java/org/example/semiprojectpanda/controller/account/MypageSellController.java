package org.example.semiprojectpanda.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageSellController {
    @GetMapping("/mypage/sell") //진짜 주소
    public String MypageSell() {
        return "account/mypage-sell"; // JSP 파일 위치
    }
}
