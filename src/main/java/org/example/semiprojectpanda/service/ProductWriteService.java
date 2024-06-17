package org.example.semiprojectpanda.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.*;
import org.example.semiprojectpanda.mapperInter.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductWriteService {
    @NonNull
    private final ProductMapperInter productMapperInter; //product
    private final ProductImageMapperInter productImageMapperInter; //productImage
    private final HashtagMapperInter hashtagMapperInter; //hashtag
    private final CategoryMapperInter categoryMapperInter; //category

    /*
    *  상품 추가를 할 때
    *  현재 로그인한 사용자의 usernum 필요
    *  입력한 상품정보를 product 테이블에 저장
    *  업로드한 여러장의 상품 이미지를 productImage 테이블에 저장
    *  입력한 해시태그를 hashtag 테이블에 저장
    */
    
    //product 추가
    public void insertProduct(ProductDto productDto)
    {
        productMapperInter.insertProduct(productDto);
    }

    //productImage 추가
    public void insertProductImage(ProductImageDto productImageDto)
    {
        productImageMapperInter.insertProductImage(productImageDto);
    }

    //Hashtag 추가
    public void insertHashtag(HashtagDto hashtagDto)
    {
        hashtagMapperInter.insertHashTag(hashtagDto);
    }

    //category의 모든 내용을 select박스를 통해 나열하기
    public List<CategoryDto> getAllCategories() {
        return categoryMapperInter.getAllCategories();
    }
}
