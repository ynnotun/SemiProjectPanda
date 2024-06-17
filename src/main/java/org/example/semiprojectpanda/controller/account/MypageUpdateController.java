package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.service.DetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class MypageUpdateController {

    @Autowired
    private DetailService detailService;

    //마이페이지
    @GetMapping("/mypage/update")
    public String mypage(
            @RequestParam("usernum") int usernum, Model model
    )
    {
        UserDto userDto = detailService.getUserByUsernum(usernum);
        model.addAttribute(userDto);

        return "account/mypage-update";
    }

    //마이페이지수정
    @PostMapping("/mypage/updatecomplete")
    public ResponseEntity<String> updateAccount(@RequestBody UserDto userDto) {
        try {
            detailService.updateAccount(userDto);
            return ResponseEntity.ok("수정되었습니다.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Failed to update account: " + e.getMessage());
        }
    }

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
