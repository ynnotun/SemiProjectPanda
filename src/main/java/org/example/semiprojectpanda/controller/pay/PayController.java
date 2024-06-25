package org.example.semiprojectpanda.controller.pay;

import org.example.semiprojectpanda.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class PayController {

    @Autowired
    private PayService payService;

    //결제
    @GetMapping("/paymentSuccess")
    public String paymentSuccess(
            @RequestParam("customerName") String customerName,
            @RequestParam("orderName") String orderName,
            @RequestParam("amount") int amount) {
        try {
            payService.processPayment(customerName, orderName, amount);
            return "redirect:/";
        } catch (Exception e) {
            return "redirect:./pay";
        }
    }

    //포인트조회
    @GetMapping("/pay")
    public String getPaymentPage(HttpSession session, Model model) {
        Object usernumObj = session.getAttribute("usernum");
        if (usernumObj == null) {
            model.addAttribute("pointamount", 0);
            return "pay/payment";
        }

        int usernum = (int) usernumObj;
        int pointamount = payService.getPointAmountByUsernum(usernum);

        model.addAttribute("pointamount", pointamount);
        return "pay/payment";
    }

    //포인트결제
    @PostMapping("/pointPayment")
    public ResponseEntity<String> processPointPayment(HttpSession session, String buyerId, String sellerNickname, int amount) {
        try {
            int buyerUsernum = (int) session.getAttribute("usernum");
            String buyerNickname = buyerId;

            boolean success = payService.processPointPayment(buyerUsernum, buyerNickname, sellerNickname, amount);

            if (success) {
                return ResponseEntity.ok("포인트 결제가 성공적으로 처리되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("포인트 결제 처리 중 오류가 발생했습니다.");
            }
        } catch (Exception e) {
            // 예외 메시지를 클라이언트로 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("서버 내부 오류가 발생했습니다: " + e.getMessage());
        }
    }

}
