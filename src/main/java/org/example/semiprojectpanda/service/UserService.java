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
        UserMapperInter.insertUser(dto);
    }
    public boolean isLoginCheck(String myid,String pass){
        return UserMapperInter.memberLogin(myid,pass)==1?true:false;
    }

}
