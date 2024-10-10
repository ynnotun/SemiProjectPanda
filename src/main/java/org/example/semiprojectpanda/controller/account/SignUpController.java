package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.naver.cloud.NaverConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignUpController {
    @Autowired
    private NaverConfig naverConfig;

    @GetMapping("/signup")
    public String login(Model model){

        String minioEndpoint = naverConfig.getEndPoint();
        model.addAttribute("MINIO_ENDPOINT", minioEndpoint);

        return "account/signup";
    }
}
