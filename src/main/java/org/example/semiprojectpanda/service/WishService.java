package org.example.semiprojectpanda.service;

import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.WishDto;
import org.example.semiprojectpanda.mapperInter.WishMapperInter;
import org.springframework.stereotype.Service;

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

    public void deleteWish(WishDto wishDto) {
        wishMapperInter.deleteWish(wishDto);
    }
}
