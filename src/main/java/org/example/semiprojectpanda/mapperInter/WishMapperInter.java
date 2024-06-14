package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
import org.example.semiprojectpanda.dto.WishDto;

@Mapper
public interface WishMapperInter {
    // Create
    @Insert("INSERT INTO WISH (usernum, productnum) VALUES (#{usernum}, #{productnum})")
    void insertWish(WishDto wish);


    @Select("SELECT COUNT(*) FROM WISH WHERE usernum = #{usernum} AND productnum = #{productnum}")
    int checkWishByUsernumAndProductnum(WishDto wish);

    // Delete
    @Delete("DELETE FROM WISH WHERE usernum = #{usernum} AND productnum = #{productnum}")
    void deleteWish(WishDto wish);

}