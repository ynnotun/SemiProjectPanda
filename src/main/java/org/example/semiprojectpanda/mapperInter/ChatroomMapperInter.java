package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
import org.example.semiprojectpanda.dto.ChatDto;
import org.example.semiprojectpanda.dto.ChatroomDto;

@Mapper
public interface ChatroomMapperInter {
    @Insert("INSERT INTO CHATROOM (chatroomname, productnum, applyusernum, productusernum) VALUES (#{chatroomname}, #{productnum}, #{applyusernum}, #{productusernum})")
    void insertCreateRoom(ChatroomDto chatroomDto);

    @Select("SELECT chatroomnum FROM CHATROOM WHERE productnum = #{productnum} and applyusernum = #{applyusernum}")
    Integer checkRoomExistence(@Param("productnum") int productnum, @Param("applyusernum") int applyusernum);

    @Select("SELECT * FROM CHATROOM WHERE chatroomnum = #{chatroom}")
    ChatroomDto getChatroomByNum(@Param("chatroom") int chatroomnum);

}
