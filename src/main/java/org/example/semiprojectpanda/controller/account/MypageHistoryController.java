package org.example.semiprojectpanda.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MypageHistoryController {
    @GetMapping("/mypage/history") //진짜 주소
    public String mypageHistory() {
        return "account/mypage-history"; // JSP 파일 위치
    }

    //판매내역
    @GetMapping("/getsell")
    @ResponseBody //ajax를 쓸 때 사용하는 어노테이션 (json 형식으로 받아온다)
    public String getSell() {
        return "";
    }
}


