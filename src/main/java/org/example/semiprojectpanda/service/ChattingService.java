package org.example.semiprojectpanda.service;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ChatroomDto;
import org.example.semiprojectpanda.dto.ChattingPrintDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.ChatroomMapperInter;
import org.example.semiprojectpanda.mapperInter.ChattingMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ChattingService {
    private final ChatroomMapperInter chatroomMapperInter;
    private final ProductMapperInter productMapperInter;
    private final ChattingMapperInter chattingMapperInter;

    @Transactional
    public int createCheckRoom(int productnum, int usernum) {
        Integer checkRoom = chatroomMapperInter.checkRoomExistence(productnum, usernum);
        if (checkRoom == null) {
            ProductDto product = productMapperInter.getProductByProductnum(productnum);
            chatroomMapperInter.insertCreateRoom(ChatroomDto.builder()
                    .applyusernum(usernum)
                    .chatroomname(product.getProducttitle())
                    .productusernum(product.getUsernum())
                    .productnum(productnum).build());
            checkRoom = chatroomMapperInter.checkRoomExistence(productnum, usernum);
            System.out.println("checkRoom: " + checkRoom);
        }
        return checkRoom;
    }

    public ChatroomDto getChatroomByNum(int chatroomnum) {
        return chatroomMapperInter.getChatroomByNum(chatroomnum);
    }

    public boolean validateUserInChatroom(int chatroomnum, int usernum) {
        ChatroomDto chatroomDto = getChatroomByNum(chatroomnum);
        return chatroomDto != null && (chatroomDto.getApplyusernum() == usernum || chatroomDto.getProductusernum() == usernum);
    }


    public List<ChattingPrintDto> getChattingPrintByNum(int chatroomnum) {
        return chattingMapperInter.getChattingByRoomNum(chatroomnum);
    }

}
