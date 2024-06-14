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

import java.util.List;

@Service
@RequiredArgsConstructor
public class DetailService {
    private final ProductImageMapperInter productImageMapperInter;
    private final ProductMapperInter productMapperInter;
    private final UserMapperInter userMapperInter;
    private final WishMapperInter wishMapperInter;

    public UserDto getUserByUsernum(int usernum) {
        return userMapperInter.findByUsernum(usernum);
    }

    public List<ProductImageDto> getAllProductImages(int productnum) {
        return productImageMapperInter.findImageByProductnum(productnum);
    }

    public ProductDto getProductByProductnum(int productnum) {
        return productMapperInter.getProductByProductnum(productnum);
    }
//
//    public void insertWish(WishDto wishDto) {
//        wishMapperInter.insertWish(wishDto);
//    }
//
//    public int checkWish(WishDto wishDto) {
//        return wishMapperInter.checkWishByUsernumAndProductnum(wishDto);
//    }
//
//    public void deleteWish(WishDto wishDto) {
//        wishMapperInter.deleteWish(wishDto);
//    }


}
