package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
import org.example.semiprojectpanda.dto.ChatroomDto;
import org.example.semiprojectpanda.dto.ChatroomPrintDto;
import org.example.semiprojectpanda.dto.ChattingPrintDto;

import java.util.List;

@Mapper
public interface ChatroomMapperInter {
    @Insert("INSERT INTO CHATROOM (chatroomname, productnum, applyusernum, productusernum) VALUES (#{chatroomname}, #{productnum}, #{applyusernum}, #{productusernum})")
    void insertCreateRoom(ChatroomDto chatroomDto);

    @Select("SELECT chatroomnum FROM CHATROOM WHERE productnum = #{productnum} and applyusernum = #{applyusernum}")
    Integer checkRoomExistence(@Param("productnum") int productnum, @Param("applyusernum") int applyusernum);

    @Select("SELECT * FROM CHATROOM WHERE chatroomnum = #{chatroom}")
    ChatroomDto getChatroomByNum(@Param("chatroom") int chatroomnum);

    @Select("""
            SELECT
                c.chatroomnum,
                c.chatroomname,
                p.productaddress,
                a.usernickname as applyusernickname,
                a.userprofileimage as applyprofile
            FROM CHATROOM c
            JOIN USER a ON c.applyusernum = a.usernum
            JOIN PRODUCT p ON c.productnum = p.productnum
            WHERE c.productusernum = #{usernum} or c.applyusernum = #{usernum}
            ORDER BY c.chatroomnum DESC
            """)
    List<ChatroomPrintDto> getChatroomByUserNum(@Param("usernum") int usernum);


}
