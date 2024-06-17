package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.ChatDto;
import org.example.semiprojectpanda.dto.ChatLogDto;

import java.util.List;

@Mapper
public interface ChatMapperInter {

    @Insert("INSERT INTO CHAT (usernum, productnum, chatcontent) VALUES (#{usernum}, #{productnum}, #{chatcontent})")
    void insertChat(ChatDto chatDto);

    @Select("SELECT COUNT(*) FROM CHAT WHERE usernum = #{usernum} AND productnum = #{productnum}")
    int dedupeCheck(@Param("usernum") int usernum, @Param("productnum") int productnum);

    @Select("""
            SELECT
            c.chatnum,
            c.usernum,
            u.usernickname,
            u.userprofileimage,
            c.productnum,
            c.chatcontent
            FROM CHAT c
            JOIN USER u ON c.usernum = u.usernum
            WHERE c.productnum = #{productnum}
            ORDER BY c.chatcreatedate
            """)
    List<ChatLogDto> getChatLogByProductnum(@Param("productnum") int productnum);
}
