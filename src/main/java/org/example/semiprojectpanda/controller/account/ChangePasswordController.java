package org.example.semiprojectpanda.controller.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChangePasswordController {
    @GetMapping("/changepassword")
    public String changePassword() {
        return "account/changepassword";
    }
}
