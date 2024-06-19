package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.ChattingDto;
import org.example.semiprojectpanda.dto.ChattingPrintDto;

import java.util.List;

@Mapper
public interface ChattingMapperInter {
    @Insert("INSERT INTO CHATTING (sendusernum, chatroomnum, chattingmessage) VALUES (#{sendusernum}, #{chatroomnum}, #{chattingmessage})")
    void insertChatting(ChattingDto chattingDto);

    @Select("""
                SELECT
                    c.chattingnum,
                    c.sendusernum,
                    u.usernickname,
                    u.userprofileimage,
                    c.chatroomnum,
                    c.chattingmessage,
                    c.chattingcreatedat
                FROM CHATTING c
                JOIN USER u ON c.sendusernum = u.usernum
                WHERE c.chatroomnum = #{chatroomnum}
                ORDER BY c.chattingcreatedat ASC
            """)
    List<ChattingPrintDto> getChattingByRoomNum(@Param("chatroomnum") int chatroomnum);
}
