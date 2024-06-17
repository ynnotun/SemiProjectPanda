package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.example.semiprojectpanda.dto.UserDto;

import java.util.Map;

@Mapper
public interface UserMapperInter {
    @Select("SELECT * FROM USER WHERE usernum = #{usernum}")
    UserDto findByUsernum(int usernum);
    @Insert("""
            insert into USER (useremail,userpassword,username,usernickname,userprofileimage,useraddress,userphonenumber,userbirthday,usercreatedate) values 
            (#{useremail},#{userpassword},#{username},#{usernickname},#{userprofileimage},#{useraddress},#{userphonenumber},#{userbirthday},now())
            """)
    public void insertUser(UserDto dto);
        @Update("update USER set userprofileimage=#{userprofileimage} where usernum=#{usernum}")
    public void updatePhoto(Map<String, Object> map);

}
