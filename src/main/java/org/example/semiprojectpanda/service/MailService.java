package org.example.semiprojectpanda.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.semiprojectpanda.dto.MailDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
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

        // MimeMessage 객체 생성
        MimeMessage mimeMessage = emailsender.createMimeMessage();
        try {
            // MimeMessageHelper를 사용하여 HTML 콘텐츠 설정
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
            helper.setTo(mailDto.getEmail());
            helper.setSubject("PANDA 인증코드 입니다.");

            String htmlContent = "<div style=\"width: 600px; background-color: rgba(0,0,0,0.85); font-family: 'Noto Sans KR', sans-serif; padding: 20px; box-sizing: border-box;\">" +
                    "<div style=\"display: flex; align-items: center;\">" +
                    "<img src=\"https://kr.object.ncloudstorage.com/semi/panda/logo.png\" style=\"width: 400px; height: auto;\">" +
                    "<div style=\"margin-left: 20px;\">" +
                    "</div>" +
                    "</div>" +
                    "<div style=\"text-align: center; margin-top: 30px;\">" +
                    "<p style=\"font-size: 30px; font-weight: bold; color: white; margin-bottom: 40px;\">" + mailDto.getEmail() + "님</p>" +
                    "<p style=\"font-size: 22px; color: white;\">비밀번호 인증코드입니다.</p>" +
                    "</div>" +
                    "<div style=\"text-align: center; margin-top: 20px;\">" +
                    "<div style=\"display: inline-block; width: 200px; height: 40px; background-color: white;\">" +
                    "<p style=\"line-height: 40px; margin: 0; font-size: 18px;\">" + verificationCode + "</p>" +
                    "</div>" +
                    "</div>" +
                    "</div>";


            helper.setText(htmlContent, true);

            // 메일 전송
            emailsender.send(mimeMessage);
        } catch (MessagingException e) {
            e.printStackTrace(); // 에러 로그 출력
            // 예외 처리
        }
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
