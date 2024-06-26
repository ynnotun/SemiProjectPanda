package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.config.SHA256;
import org.example.semiprojectpanda.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

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
    public String changePassword(Model model) {
        return "account/changepassword"; // 변경 비밀번호 페이지로 이동
    }


    @PostMapping("/password/change")
    public ResponseEntity<String> changePassword(@RequestBody Map<String, Object> payload) {
        System.out.println("Received request to change password: " + payload); // 로그 추가

        // 비밀번호 변경 로직 추가
        try {
            int usernum = Integer.parseInt((String) payload.get("usernum"));
            String newPassword = (String) payload.get("newPassword");
            String email = (String) payload.get("email");
            SHA256 sha256 = new SHA256();
            String password = sha256.encrypt(newPassword + sha256.encrypt(email));

            detailService.changePassword(usernum, password);
            System.out.println("Usernum: " + usernum + ", New Password: " + password);
            return ResponseEntity.ok("Password changed successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Failed to change password.");
        }
    }
}
