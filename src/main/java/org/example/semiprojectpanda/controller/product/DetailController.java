package org.example.semiprojectpanda.controller.product;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.*;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.example.semiprojectpanda.service.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class DetailController {
    private final DetailService detailService;
    private final ChatService chatService;
    private final WishService wishService;
    private final UserMapperInter userMapperInter;
    private final ReviewService reviewService;


    @Transactional
    @GetMapping("/product/detail")
    public String detail(
            @RequestParam("productnum") int productnum,
            HttpServletRequest request,
            Model model
    ) {
        ProductDto productDto = detailService.getProductByProductnum(productnum);
        model.addAttribute("productDto", productDto);

        HttpSession session = request.getSession();
        var usernum = session.getAttribute("usernum");
        if (usernum != null) {
            int wishCheck = wishService.checkWish(
                    WishDto.builder()
                            .usernum((Integer) usernum)
                            .productnum(productDto.getProductnum())
                            .build()
            );
            model.addAttribute("wishCheck", wishCheck);
        }

        UserDto userDto = detailService.getUserByUsernum(productDto.getUsernum());
        String userGrade = reviewService.getGradeByUsernum((productDto.getUsernum()));
        model.addAttribute("userGrade", userGrade);

        model.addAttribute("imageDtoList", detailService.getAllProductImages(productnum));
        model.addAttribute("productUserDto", userDto);


        return "product/product-detail";
    }

    @Transactional
    @GetMapping("/product/wish")
    @ResponseBody
    public Map<String, String> wish(
            @RequestParam("usernum") int usernum,
            @RequestParam("productnum") int productnum
    ) {
        Map<String, String> result = new HashMap<>();
        WishDto wishDto = WishDto.builder()
                .usernum(usernum)
                .productnum(productnum).build();

        int check = wishService.checkWish(wishDto);
        if (check == 0) {
            result.put("status", "wish add");
            wishService.insertWish(wishDto);
        } else {
            result.put("status", "wish delete");
            wishService.deleteWish(wishDto);
        }

        return result;
    }


    @PostMapping("/product/chat")
    @ResponseBody
    @Transactional
    public ResponseEntity<Map<String, String>> chat(
            @RequestParam("productnum") int productnum,
            @RequestParam("productUserNum") int productUserNum,
            HttpServletRequest request
    ) {
        Map<String, String> result = new HashMap<>();

        HttpSession session = request.getSession();
        var usernum = session.getAttribute("usernum");
        if (usernum == null || usernum.equals(productUserNum)) {
            result.put("status", "fail");
            return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
        }

        chatService.chatApply((Integer) usernum, productnum);
        result.put("status", "success");

        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("/product/{action}")
    @ResponseBody
    @Transactional
    public ResponseEntity<Map<String, String>> handleChatAction(
            @PathVariable("action") String action,
            @RequestParam("productnum") int productnum,
            @RequestParam("productUserNum") int productUserNum,
            @RequestParam("customerNum") int customerNum,
            HttpServletRequest request
    ) {
        Map<String, String> result = new HashMap<>();

        HttpSession session = request.getSession();
        Integer usernum = (Integer) session.getAttribute("usernum");
        if (usernum == null || !usernum.equals(productUserNum)) {
            result.put("status", "fail");
            return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
        }

        switch (action) {
            case "reservation":
                chatService.chatReserve(usernum, productnum, customerNum);
                break;
            case "finish":
                chatService.chatComplete(usernum, productnum, customerNum);
                break;
            case "cancel":
                chatService.chatReserveCancel(usernum, productnum, customerNum);
                break;
            default:
                result.put("status", "fail");
                return new ResponseEntity<>(result, HttpStatus.BAD_REQUEST);
        }

        result.put("status", "success");
        return new ResponseEntity<>(result, HttpStatus.OK);
    }


    @GetMapping("/product/chat-log")
    @ResponseBody
    public List<ChatLogDto> chatLog(
            @RequestParam("productnum") int productnum
    ) {
        return chatService.getChatListByProductNum(productnum);
    }



















    @Transactional
    @PostMapping("/product/login")
    public ResponseEntity<Map<String, String>> loginAction(
            @RequestParam("usernum") int usernum,
            HttpServletRequest request
    ) {
        var userDto = userMapperInter.findByUsernum(usernum);
        HttpSession session = request.getSession();
        session.setAttribute("usernum", usernum);
        session.setAttribute("usernickname", userDto.getUsernickname());
        session.setAttribute("userprofileimage", userDto.getUserprofileimage());
        session.setAttribute("loginok","yes");
        return ResponseEntity.ok(Map.of("message", "Success"));
    }

    @Transactional
    @PostMapping("/product/logout")
    public ResponseEntity<Map<String, String>> logoutAction(
            HttpServletRequest request
    ) {

        HttpSession session = request.getSession();
        session.removeAttribute("usernum");
        session.removeAttribute("usernickname");
        session.removeAttribute("userprofileimage");
        session.removeAttribute("loginok");
        return ResponseEntity.ok(Map.of("message", "Success"));
    }

}
