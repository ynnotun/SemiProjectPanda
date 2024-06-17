package org.example.semiprojectpanda.controller.account;

import com.sun.mail.iap.Response;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class SeachPasswordController {

    @Autowired
    private DetailService detailService;

    @GetMapping("/seachpassword")
    public String searchPassword(@RequestParam(value = "email", required = false) String email, Model model) {
        model.addAttribute("email", email);
        return "account/seachpassword";
    }

    @PostMapping("/findPassword")
    public ResponseEntity<Map<String, Object>> findPassword(@RequestParam("email") String email) {
        Map<String, Object> result = new HashMap<>();
        try {
            int usernum = detailService.getUserNumByEmail(email);
            result.put("usernum", usernum);

            return ResponseEntity.ok(result);
        } catch (Exception e) {
            result.put("error", "유저를 찾을 수 없습니다.");
            return ResponseEntity.ok(result);

        }
    }

}

