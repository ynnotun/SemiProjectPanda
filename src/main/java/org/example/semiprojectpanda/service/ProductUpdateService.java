package org.example.semiprojectpanda.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.mapperInter.CategoryMapperInter;
import org.example.semiprojectpanda.mapperInter.HashtagMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductImageMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductUpdateService {

    @NonNull
    private final ProductMapperInter productMapperInter; //product
    private final ProductImageMapperInter productImageMapperInter; //productImage
    private final HashtagMapperInter hashtagMapperInter; //hashtag
    private final CategoryMapperInter categoryMapperInter; //category

    //category의 모든 내용을 select박스를 통해 나열하기
    public List<CategoryDto> getAllCategories() {
        return categoryMapperInter.getAllCategories();
    }

}
