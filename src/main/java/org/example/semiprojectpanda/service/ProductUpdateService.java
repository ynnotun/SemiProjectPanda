package org.example.semiprojectpanda.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;
import org.example.semiprojectpanda.mapperInter.CategoryMapperInter;
import org.example.semiprojectpanda.mapperInter.HashtagMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductImageMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    //상품에 대한 내용 불러오기
    public ProductDto getProductByProductnum(int productnum) {
        return productMapperInter.getProductByProductnum(productnum);
    }

    //상품이미지에 대한 내용 전부 불러오기
    public List<ProductImageDto> getAllProductImages(int productnum) {
        return productImageMapperInter.findImageByProductnum(productnum);
    }

    //상품의 해시태그에 대한 내용 전부 불러오기
    public List<HashtagDto> getAllHashtags(int productnum) {
        return hashtagMapperInter.findHashtagByProductnum(productnum);
    }

    // 수정이 완료된다면 모두 함께 실행되어야 함
    //1. 상품 설명 수정
    public void updateProduct(ProductDto productDto)
    {
        productMapperInter.updateProduct(productDto);
    }

    //2. 상품이미지파일을 버켓에서 삭제
    //ncpobjectservice에서 수행

    //3. 상품이미지 테이블의 현재 상품에 해당하는 행 전부 삭제
    public void deleteAllProductImages(int productnum)
    {
        productImageMapperInter.deleteProductImageByProductnum(productnum);
    }

    //3.1 상품이미지 테이블에서 지정된 행만 삭제
    public void deleteProductImageByFilename(String filename)
    {
        productImageMapperInter.deleteProductImageByFilename(filename);
    }

    //4. 상품이미지 테이블에 추가
    public void insertProductImage(ProductImageDto productImageDto)
    {
        productImageMapperInter.insertProductImage(productImageDto);
    }

    //5. 해시태그 테이블의 현재 상품에 해당하는 행 전부 삭제
    public void deleteAllHashtags(int productnum)
    {
        hashtagMapperInter.deleteHashtagByProductnum(productnum);
    }

    //6. 해시태그 테이블에 추가
    public void insertHashtag(HashtagDto hashtagDto)
    {
        hashtagMapperInter.insertHashTag(hashtagDto);
    }
}
