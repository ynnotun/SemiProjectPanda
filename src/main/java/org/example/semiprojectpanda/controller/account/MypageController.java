package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MypageController {
    @Autowired
    private UserMapperInter userMapperInter;

    @GetMapping("/mypage")
    public String mypage(@RequestParam int usernum, Model model) {
        UserDto dto = userMapperInter.findByUsernum(usernum);
        model.addAttribute("usernum", usernum);
        model.addAttribute("dto", dto);
        return "account/mypage";
    }
}
