    package org.example.semiprojectpanda.service;

    import org.example.semiprojectpanda.dto.UserDto;
    import org.example.semiprojectpanda.mapperInter.UserMapperInter;
    import org.springframework.beans.factory.annotation.Autowired;
    import org.springframework.stereotype.Service;

    import java.util.HashMap;
    import java.util.Map;

    @Service
    public class UserService {
        @Autowired
        private UserMapperInter UserMapperInter;

        public void insertMember(UserDto dto){
            System.out.println(dto);
            UserMapperInter.insertUser(dto);
        }
        public boolean isLoginCheck(String useremail,String userpassword){
            return UserMapperInter.memberLogin(useremail,userpassword)==1?true:false;
        }
        public int getUserNumByEmail(String useremail) {
            return UserMapperInter.getUserNumByEmail(useremail);
        }

        public UserDto findByUsernum(int usernum) {
            return UserMapperInter.findByUsernum(usernum);
        }
        public int nicknameCheckCount(String searchnickname){
            return UserMapperInter.nicknameCheckCount(searchnickname);
        }
        public int emailCheckCount(String searchemail){
            return UserMapperInter.emailCheckCount(searchemail);
        }
    }
