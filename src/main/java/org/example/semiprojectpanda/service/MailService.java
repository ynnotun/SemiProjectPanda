package org.example.semiprojectpanda.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.semiprojectpanda.dto.MailDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Random;


@Service
@RequiredArgsConstructor
@Slf4j
public class MailService {

    @Autowired
    private JavaMailSender emailsender;
    @Autowired
    private  RedisService redisService;

    public void sendVerificationCode(MailDto mailDto){

        String verificationCode = generateVerificationCode();
        redisService.save(mailDto.getEmail(), verificationCode);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(mailDto.getEmail());
        message.setSubject("인증코드");
        message.setText("인증코드는 : " + verificationCode);
        emailsender.send(message);
    }

    private String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }

    public boolean verifyCode(String email, String code) {
        String storedCode = redisService.get(email);
        if (storedCode != null && storedCode.equals(code)) {
            redisService.delete(email);
            return true;
        }
        return false;
    }

}
