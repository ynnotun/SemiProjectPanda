package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;

@Mapper
public interface PayMapperInter {

    @Select("SELECT count(*) FROM USER WHERE usernickname = #{sellerNickname}")
    int findUserNumByNickname(String sellerNickname);

    @Select("SELECT * FROM USER WHERE usernickname = #{sellerNickname}")
    int findUserNum(String sellerNickname);

    @Select("SELECT count(*) FROM POINT WHERE usernum = #{usernum}")
    int findPointByUserNum(int usernum);

    @Update("UPDATE POINT SET pointamount = pointamount + #{amount}, pointpurchaseday = NOW() WHERE usernum = #{usernum}")
    void updatePoint(@Param("usernum") int usernum, @Param("amount") int amount);

    @Insert("INSERT INTO POINT (usernum, pointamount, pointpurchaseday) VALUES (#{usernum}, #{amount}, NOW())")
    void insertPoint(@Param("usernum") int usernum, @Param("amount") int amount);

    @Select("SELECT pointamount FROM POINT WHERE usernum = #{usernum}")
    Integer findPointAmountByUsernum(int usernum);

    @Update("UPDATE POINT SET pointamount = #{pointamount} WHERE usernum = #{usernum}")
    void updatePointAmount(@Param("usernum") int usernum, @Param("pointamount") int pointamount);


}
