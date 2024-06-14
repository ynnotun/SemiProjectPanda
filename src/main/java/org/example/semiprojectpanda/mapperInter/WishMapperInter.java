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

    //찜목록
    @Select("select * from wish where usernum=#{usernum}") //이 사람의 찜목록을 불러와야 하니까!
    public List<WishDto> getWishList(int usernum);
}
