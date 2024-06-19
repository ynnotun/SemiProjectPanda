package org.example.semiprojectpanda.controller.chatting;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ChatroomDto;
import org.example.semiprojectpanda.dto.ChattingPrintDto;
import org.example.semiprojectpanda.service.ChattingService;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequiredArgsConstructor
public class ChattingController {
    private final ChattingService chattingService;

    @GetMapping("/chatting/{chattingRoomNum}")
    public String chattingRoomMapping(
            @PathVariable int chattingRoomNum,
            HttpServletRequest request,
            Model model
    ) {
        int usernum = (int) request.getSession().getAttribute("usernum");
        if (usernum == 0) {
            return "redirect:/login";
        }

        ChatroomDto chatroomDto = chattingService.getChatroomByNum(chattingRoomNum);
        if (chatroomDto == null || (chatroomDto.getApplyusernum() != usernum && chatroomDto.getProductusernum() != usernum)) {
            return "redirect:/";
        }

        model.addAttribute("roomDto", chatroomDto);
        return "websocket/chatting/chat";
    }


    @GetMapping("/chat/repository")
    @ResponseBody
    public List<ChattingPrintDto> repository(@RequestParam("chatroomnum") int chatroomnum, HttpServletRequest request) {
        int usernum = (int) request.getSession().getAttribute("usernum");
        if (usernum == 0 || !chattingService.validateUserInChatroom(chatroomnum, usernum)) {
            return Collections.emptyList();
        }
        return chattingService.getChattingPrintByNum(chatroomnum);
    }



    //    글 상세 Chat Now 시 사용할 것
    @PostMapping("/chatting/room")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> createChattingRoom(
            @RequestParam("productnum") int productnum,
            HttpServletRequest request
    ) {
        HttpSession session = request.getSession();
        int usernum = (int) session.getAttribute("usernum");
        Map<String, Object> result = new HashMap<>();
        int chatRoomNum = chattingService.createCheckRoom(productnum, usernum);
        System.out.println(chatRoomNum);
        if (chatRoomNum == 0) {
            result.put("status", "error");
            return ResponseEntity.ok(result);
        }
        result.put("chatRoomNum", chatRoomNum);
        result.put("status", "success");
        return ResponseEntity.ok(result);
    }
}
