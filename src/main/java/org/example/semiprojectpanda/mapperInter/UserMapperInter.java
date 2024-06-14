package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.UserDto;

@Mapper
public interface UserMapperInter {
    @Select("SELECT * FROM USER WHERE usernum = #{usernum}")
    UserDto findByUsernum(int usernum);
}
