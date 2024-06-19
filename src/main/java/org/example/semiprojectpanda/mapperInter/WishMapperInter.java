package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.WishDto;

import java.util.List;

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

    //찜목록
    @Select("""
        select * from PRODUCT where productnum 
        in (SELECT productnum FROM WISH where usernum=#{usernum})
    """) //이 사람의 찜목록을 불러와야 하니까!
    public List<ProductDto> getWishList(int usernum);


    // 찜목록 최신순으로 3개만 불러오기
    @Select("""
        select * from PRODUCT where productnum 
        in (SELECT productnum FROM WISH where usernum=#{usernum})
        order by productnum desc LIMIT 0, 3
    """)
    public List<ProductDto> getThreeFromWishList(int usernum);

}