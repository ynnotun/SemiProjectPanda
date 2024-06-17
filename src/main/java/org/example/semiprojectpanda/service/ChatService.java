package org.example.semiprojectpanda.service;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ChatDto;
import org.example.semiprojectpanda.dto.ChatLogDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.ChatMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChatService {
    private final ChatMapperInter chatMapperInter;
    private final UserMapperInter userMapperInter;
    private final ProductMapperInter productMapperInter;

    @Transactional
    public void chatApply(int usernum, int productnum) {
        var dedupeCheck = chatMapperInter.dedupeCheck(usernum,productnum);
        if (dedupeCheck == 1){
            return;
        }
        var userDto = userMapperInter.findByUsernum(usernum);
        chatMapperInter.insertChat(
                ChatDto.builder()
                        .usernum(usernum)
                        .productnum(productnum)
                        .chatcontent(userDto.getUsernickname() + "님이 채팅을 시작하였습니다.")
                        .build()
        );
    }

    @Transactional
    public void chatReserve(int usernum, int productnum, int customerNum) {
        var customerDto = userMapperInter.findByUsernum(customerNum);
        chatMapperInter.insertChat(
                ChatDto.builder()
                        .usernum(usernum)
                        .productnum(productnum)
                        .chatcontent(customerDto.getUsernickname() + "님과 거래 예약되었습니다.")
                        .build()
        );
        productMapperInter.updateProductStatusAndCustomer(
                ProductDto.builder()
                        .productnum(productnum)
                        .customernum(customerNum)
                        .productstatus("예약 중")
                        .build()
        );
    }

    @Transactional
    public void chatComplete(int usernum, int productnum, int customerNum) {
        var customerDto = userMapperInter.findByUsernum(customerNum);
        chatMapperInter.insertChat(
                ChatDto.builder()
                        .usernum(usernum)
                        .productnum(productnum)
                        .chatcontent(customerDto.getUsernickname() + "님과 거래 완료되었습니다.")
                        .build()
        );
        productMapperInter.updateProductStatusAndCustomer(
                ProductDto.builder()
                        .productnum(productnum)
                        .customernum(customerNum)
                        .productstatus("거래 완료")
                        .build()
        );
    }



    public List<ChatLogDto> getChatListByProductNum(int productnum) {
        return chatMapperInter.getChatLogByProductnum(productnum);
    }

}
