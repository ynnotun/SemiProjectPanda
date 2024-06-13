package org.example.semiprojectpanda.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageHistoryController {
    @GetMapping("/mypage/history") //진짜 주소
    public String mypageHistory() {
        return "account/mypage-history"; // JSP 파일 위치
    }
}
