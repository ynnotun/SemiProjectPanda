package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
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


    //마이페이지 수정
    @Update("UPDATE USER SET usernickname = #{nickname}, userpassword = #{userpassword}, userprofileimage = #{userprofileimage} WHERE usernum = #{usernum}")
    int updateUser(UserDto userdto);

    @Select("SELECT userpassword FROM USER WHERE useremail = #{useremail}")
    String getPasswordByEmail(@Param("useremail") String useremail);

    //usernum값 얻기
    @Select("SELECT usernum FROM USER WHERE useremail = #{useremail}")
    int getUserNumByEmail(@Param("useremail") String useremail);

    // 비밀번호 변경
    @Update("UPDATE USER SET userpassword = #{newPassword} WHERE usernum = #{usernum}")
    boolean changePassword(int usernum, String newPassword);

    //회원 탈퇴
    @Delete("DELETE FROM USER WHERE usernum = #{usernum}")
    void deleteUserByUsernum(@Param("usernum") int usernum);
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
