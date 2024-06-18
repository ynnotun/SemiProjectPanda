package org.example.semiprojectpanda.controller.account;

import ch.qos.logback.core.net.SyslogOutputStream;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequiredArgsConstructor
public class LoginController {
    private final UserService userService;
    @Autowired
    private NcpObjectStorageService storageService;
    private String buckname="semi";
    private String folderName="panda";

    @GetMapping("/login")
    public String login() {
        return "account/login";
    }

    @PostMapping("/save")
    public String saveDate(
            @ModelAttribute UserDto dto,
            @RequestParam(required = false, value = "myfile", defaultValue="userprofileimage")MultipartFile myfile
    ){
        System.out.println(dto);
        if (myfile != null){
            //스토리지에 업로드
            String photo=storageService.uploadFile(buckname, folderName, myfile);
            dto.setUserprofileimage(photo);//업로드된 UUID 파일명을 dto 에 저장
        }
        //db 에 저장
        userService.insertMember(dto);

        return "account/login";
    }
    @ResponseBody
    @GetMapping("/member/login")
    public Map<String,String> isLogin(
            @RequestParam(defaultValue = "no") String saveid,
            @RequestParam String useremail,
            @RequestParam String userpassword,
            HttpSession session
    ){
        Map<String,String> map=new HashMap<>();
        //로그인 상태
        boolean loginStatus=userService.isLoginCheck(useremail, userpassword);
        if (loginStatus){
            //아이디와 비번이 맞은경우
            map.put("status","success");
            //로그인 성공시 세션에 저장
            session.setAttribute("saveid",saveid.equals("no")?"no":"yes");
            session.setAttribute("loginok","yes");
            session.setAttribute("loginid",useremail);
        }else {
            //아이디와 비번이 틀린경우
            map.put("status","fail");
        }
        return map;
    }
}
