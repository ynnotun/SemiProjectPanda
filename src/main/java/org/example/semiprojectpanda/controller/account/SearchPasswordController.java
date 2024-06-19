package org.example.semiprojectpanda.controller.account;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class SearchPasswordController {

    @Autowired
    private DetailService detailService;

    @GetMapping("/searchpassword")
    public String searchPassword(@RequestParam(value = "email", required = false) String email, Model model) {
        model.addAttribute("email", email);
        return "account/searchpassword";
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

