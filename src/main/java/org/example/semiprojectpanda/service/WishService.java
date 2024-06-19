package org.example.semiprojectpanda.service;

import org.example.semiprojectpanda.dto.ProductDto;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.WishDto;

import org.example.semiprojectpanda.mapperInter.WishMapperInter;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WishService {

    private final WishMapperInter wishMapperInter;

    public void insertWish(WishDto wishDto) {
        wishMapperInter.insertWish(wishDto);
    }

    public int checkWish(WishDto wishDto) {
        return wishMapperInter.checkWishByUsernumAndProductnum(wishDto);
    }

    public List<ProductDto> getWishList(int usernum) {
        return wishMapperInter.getWishList(usernum);
    }

    public void deleteWish(WishDto wishDto) {
        wishMapperInter.deleteWish(wishDto);
    }

    public List<ProductDto> getThreeFromWishList(int usernum){
        return wishMapperInter.getThreeFromWishList(usernum);
    }
}
