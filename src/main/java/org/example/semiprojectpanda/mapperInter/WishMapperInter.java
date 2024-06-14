package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.WishDto;

import java.util.List;

@Mapper
public interface WishMapperInter {
    //찜목록
    @Select("select * from wish where usernum=#{usernum}") //이 사람의 찜목록을 불러와야 하니까!
    public List<WishDto> getWishList(int usernum);
}
