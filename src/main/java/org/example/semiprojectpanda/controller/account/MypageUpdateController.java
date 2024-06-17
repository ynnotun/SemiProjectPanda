package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MypageUpdateController {

    @Autowired
    private DetailService detailService;
    @GetMapping("/mypage/update")
    public String mypage(
            @RequestParam("usernum") int usernum, Model model
    )
    {
        UserDto userDto = detailService.getUserByUsernum(usernum);
        model.addAttribute(userDto);

        return "account/mypage-update";
    }
}
