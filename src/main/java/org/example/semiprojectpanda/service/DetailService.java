package org.example.semiprojectpanda.service;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;
import org.example.semiprojectpanda.dto.UserDto;
import org.example.semiprojectpanda.dto.WishDto;
import org.example.semiprojectpanda.mapperInter.ProductImageMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.example.semiprojectpanda.mapperInter.WishMapperInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class DetailService {
    private final ProductImageMapperInter productImageMapperInter;
    private final ProductMapperInter productMapperInter;
    private final UserMapperInter userMapperInter;

    public UserDto getUserByUsernum(int usernum) {
        return userMapperInter.findByUsernum(usernum);
    }

    public List<ProductImageDto> getAllProductImages(int productnum) {
        return productImageMapperInter.findImageByProductnum(productnum);
    }

    public ProductDto getProductByProductnum(int productnum) {
        return productMapperInter.getProductByProductnum(productnum);
    }


    public boolean checkNickname(String nickname) {
        return userMapperInter.checkNickname(nickname) > 0;
    }
    //마이페이지 수정
    public void updateUser(UserDto userDto) {
        if (userDto.getUserprofileimage() == null || userDto.getUserprofileimage().isEmpty()) {
            UserDto existingUser = getUserByUsernum(userDto.getUsernum());
            userDto.setUserprofileimage(existingUser.getUserprofileimage());
        }
        userMapperInter.updateUser(userDto);
    }
    //email값 받아서 usernum값 얻기
    public int getUserNumByEmail(String email){
        return userMapperInter.getUserNumByEmail(email);
    }
    //비밀번호 변경
    public boolean changePassword(int usernum, String newPassword) {
        return userMapperInter.changePassword(usernum, newPassword);
    }
    //회원탈되
    @Transactional
    public void deleteAccount(int usernum) throws Exception {
        userMapperInter.deleteUserByUsernum(usernum);
    }



}
