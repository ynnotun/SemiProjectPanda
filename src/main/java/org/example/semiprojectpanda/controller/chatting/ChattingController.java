package org.example.semiprojectpanda.controller.chatting;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
public class ChattingController {
    @GetMapping("/chatting")
    public String chatting(Model model) {
        return "websocket/chat";
    }

    @PostMapping("/chatting/{chattingroom}")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> chatting(
            @PathVariable String chattingroom,
            @RequestParam("sendusernum")int sendusernum
    ){

        return ResponseEntity.ok(Map.of());
    }
}
