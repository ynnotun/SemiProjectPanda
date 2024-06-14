package org.example.semiprojectpanda.controller.mail;

import org.example.semiprojectpanda.dto.MailDto;
import org.example.semiprojectpanda.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class MailController {

    @Autowired
    private MailService mailService;

    @GetMapping("/mail")
    public String email(){

        return "mail/test";
    }

    @PostMapping("/mail/send")
    public ResponseEntity<String> sendVerificationCode(@RequestBody MailDto mailDto) {
        mailService.sendVerificationCode(mailDto);
        return ResponseEntity.ok("인증코드를 보냈습니다.");
    }

    @PostMapping("/verify")
    public ResponseEntity<String> verifyCode(@RequestParam String email, @RequestParam String code) {
        boolean isVerified = mailService.verifyCode(email, code);
        if (isVerified) {
            return ResponseEntity.ok("인증 성공!");
        } else {
            return ResponseEntity.status(400).body("인증 실패!");
        }
    }


}
