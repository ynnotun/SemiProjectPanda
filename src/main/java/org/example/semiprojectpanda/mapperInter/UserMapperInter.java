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
    @Select("""
            select count(*) from USER where useremail=#{useremail} and userpassword=#{userpassword}
            """)
    public int isLoginCheck(String useremail,String userpassword);

}
