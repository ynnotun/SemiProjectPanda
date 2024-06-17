package org.example.semiprojectpanda.service;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.WishDto;
import org.example.semiprojectpanda.mapperInter.WishMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WishService {
    @Autowired
    private WishMapperInter wishMapperInter; //WishMapperInter 를 여기서 wishMapperInter라고 부르겠다

    public List<ProductDto> getWishList(int usernum) {
        return wishMapperInter.getWishList(usernum);
    }

}
