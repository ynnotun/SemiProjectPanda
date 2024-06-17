package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class ChangePasswordController {

    @Autowired
    private DetailService detailService;


  /*  @GetMapping("/password")
    public String showChangePasswordPage(@RequestParam("email") String email, Model model) {
        model.addAttribute("email", email);
        return "account/changepassword";
    }*/

    @GetMapping("/password")
    public String changePassword(@RequestParam(value = "email", required = false) String email, Model model) {
        if (email == null || email.isEmpty()) {
            model.addAttribute("message", "Email not found in URL parameters.");
            return "account/changepassword"; // 변경 비밀번호 페이지로 이동
        }
        model.addAttribute("email", email);
        return "account/changepassword"; // 변경 비밀번호 페이지로 이동
    }


    @PostMapping("/password/change")
    @ResponseBody
    public String changePassword(@RequestParam("usernum") int usernum, @RequestParam("newPassword") String newPassword) {
        boolean isUpdated = detailService.changePassword(usernum, newPassword);
        if (isUpdated) {
            return "비밀번호가 성공적으로 변경되었습니다.";
        } else {
            return "비밀번호 변경에 실패했습니다.";
        }
    }
}
