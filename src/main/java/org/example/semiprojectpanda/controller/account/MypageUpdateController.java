package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.naver.cloud.NcpObjectStorageService;
import org.example.semiprojectpanda.service.DetailService;
import org.example.semiprojectpanda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MypageUpdateController {

    @Autowired
    private DetailService detailService;
    @Autowired
    private NcpObjectStorageService storageService;

    @Autowired
    private UserService userService;
    private String bucketName = "semi";
    private String folderName = "panda";


    //마이페이지
    @GetMapping("/mypage/update")
    public String mypage(
            @RequestParam("usernum") Integer usernum,
            HttpServletRequest request,
            Model model
    ) {
        HttpSession session = request.getSession();
        Integer sessionUsernum = (Integer) session.getAttribute("usernum");
        if (sessionUsernum == null || !sessionUsernum.equals(usernum)) {
            return "redirect:/";
        }

        UserDto userDto = detailService.getUserByUsernum(usernum);
        model.addAttribute(userDto);

        return "account/mypage-update";
    }

    @PostMapping("/upload")
    @ResponseBody
    public Map<String, String> uploadPhoto(
            @RequestParam("upload") MultipartFile upload,
            @RequestParam int num,
            HttpServletRequest request
    ) {
        // 스토리지에 업로드하기
        String photo = storageService.uploadFile(bucketName, folderName, upload);

        // DB에서 photo 수정
        userService.updatePhoto(num, photo);

        Map<String, String> map = new HashMap<>();
        map.put("photoname", photo);
        return map;
    }

    //닉네임중복체크
    @PostMapping("/mypage/checkNickname")
    @ResponseBody
    public Map<String, Boolean> checkNickname(@RequestBody Map<String, String> request) {
        String nickname = request.get("nickname");
        boolean exists = detailService.checkNickname(nickname);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);
        return response;
    }

    @PostMapping("/mypage/updatecomplete")
    @ResponseBody
    public String updateUser(@RequestBody UserDto userDto) {
        UserDto existingUser = detailService.getUserByUsernum(userDto.getUsernum());

        if (userDto.getUsernickname() == null || userDto.getUsernickname().isEmpty()) {
            userDto.setUsernickname(existingUser.getUsernickname());
        }
        if (userDto.getUserpassword() == null || userDto.getUserpassword().isEmpty()) {
            userDto.setUserpassword(existingUser.getUserpassword());
        }
        if (userDto.getUserprofileimage() == null || userDto.getUserprofileimage().isEmpty()) {
            userDto.setUserprofileimage(existingUser.getUserprofileimage());
        }
        detailService.updateUser(userDto);
        return "수정되었습니다.";
    }

    //회원탈퇴
    @PostMapping("/mypage/delete")
    public ResponseEntity<String> deleteAccount(@RequestParam("usernum") int usernum) {
        try {
            detailService.deleteAccount(usernum);
            return ResponseEntity.ok("계정 탈퇴완료되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Failed to delete account: " + e.getMessage());
        }
    }

}
