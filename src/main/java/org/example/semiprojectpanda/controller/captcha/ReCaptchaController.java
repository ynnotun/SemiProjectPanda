package org.example.semiprojectpanda.controller.captcha;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
public class ReCaptchaController {

    @ResponseBody
    @PostMapping(value = "VerifyRecaptcha")
    public ResponseEntity<?> VerifyRecaptcha(String recaptcha) throws IOException {
        VerifyRecaptcha.setSecretKey("6Ldh4_0pAAAAAMKg_7IYkRCq0yg_VE6FN9MwWIEM");
        return ResponseEntity.status(HttpStatus.OK).body(VerifyRecaptcha.verify(recaptcha));
    }

    @GetMapping("captcha")
    public String cap(){
        return "captcha/captcha";
    }

}
