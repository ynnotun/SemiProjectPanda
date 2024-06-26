package org.example.semiprojectpanda.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.mapperInter.ReviewMapperInter;
import org.example.semiprojectpanda.mapperInter.UserMapperInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ReviewWriteService {
    @NonNull
    private final ReviewMapperInter reviewMapperInter;
    private final ProductMapperInter productMapperInter;
    private final UserMapperInter userMapperInter;


    //리뷰 추가
    public void insertReview(ReviewDto reviewDto) {
        reviewMapperInter.insertReview(reviewDto);
    }


    @Transactional
    public void productStatChange(int usernum, int productnum, int customerNum) {
        // 1. 현재 상품 상태 조회
        String currentStatus = productMapperInter.getProductStatus(productnum);

        if (usernum == customerNum) {
            //구매자 리뷰 완료 상태 변경
            productMapperInter.updateProductStatusAndCustomer(
                    ProductDto.builder()
                            .productnum(productnum)
                            .customernum(customerNum)
                            .productstatus("구매자 리뷰 완료")
                            .build()
            );
        } else {
            //판매자 리뷰 완료 상태 변경
            productMapperInter.updateProductStatusAndCustomer(
                    ProductDto.builder()
                            .productnum(productnum)
                            .customernum(customerNum)
                            .productstatus("판매자 리뷰 완료")
                            .build()

            );
        }

        // 4. 판매자와 구매자 리뷰가 모두 완료된 경우 상품 상태를 "리뷰 완료"로 변경
        if (currentStatus.equals("판매자 리뷰 완료") && productMapperInter.getProductStatus(productnum).equals("구매자 리뷰 완료")) {
            productMapperInter.updateProductStatusAndCustomer(
                    ProductDto.builder()
                            .productnum(productnum)
                            .customernum(customerNum)
                            .productstatus("리뷰 완료")
                            .build()
            );
        }
    }


}
