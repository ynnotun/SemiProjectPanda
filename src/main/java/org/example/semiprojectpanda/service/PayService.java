package org.example.semiprojectpanda.service;

import org.example.semiprojectpanda.dto.PayDto;
import org.example.semiprojectpanda.mapperInter.PayMapperInter;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PayService {

    @Autowired
    private PayMapperInter payMapperInter;

    public void processPayment(String customerName, String orderName, int amount) throws Exception {
        int sellerUserNum = payMapperInter.findUserNumByNickname(orderName);
        int findUserNum = payMapperInter.findUserNum(orderName);

        if (sellerUserNum == 0) {
            throw new Exception("판매자를 찾을 수 없습니다.");
        }

        int point = payMapperInter.findPointByUserNum(sellerUserNum);

        if (point != 0) {
            payMapperInter.updatePoint(findUserNum, amount);
        } else {
            payMapperInter.insertPoint(findUserNum, amount);
        }
    }

    public int getPointAmountByUsernum(int usernum) {

        Integer pointamount = payMapperInter.findPointAmountByUsernum(usernum);

        return pointamount != null ? pointamount : 0;
    }

    @Transactional
    public boolean processPointPayment(int buyerUsernum, String buyerNickname, String sellerNickname, int amount) {
        try {
            int sellerUsernum = payMapperInter.findUserNum(sellerNickname);

            // 구매자 포인트 차감
            Integer buyerPoint = payMapperInter.findPointAmountByUsernum(buyerUsernum);
            if (buyerPoint == null || buyerPoint < amount) {
                return false; // 잔액 부족
            }
            payMapperInter.updatePointAmount(buyerUsernum, buyerPoint - amount);

            // 판매자 포인트 추가
            Integer sellerPoint = payMapperInter.findPointAmountByUsernum(sellerUsernum);
            if (sellerPoint == null) {
                payMapperInter.insertPoint(sellerUsernum, amount);
            } else {
                payMapperInter.updatePointAmount(sellerUsernum, sellerPoint + amount);
            }

            return true;
        } catch (Exception e) {
            throw new RuntimeException("포인트 결제 처리 중 오류가 발생했습니다: " + e.getMessage(), e);
        }
    }


}
