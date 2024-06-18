package org.example.semiprojectpanda.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.mapperInter.ReviewMapperInter;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReviewWriteService {
    @NonNull
    private final ReviewMapperInter reviewMapperInter;

    /*
    리뷰 추가할 때
    로그인 된 사람이 send
    받는사람이 receive
    리뷰점수, 리뷰내용
     */

    //리뷰 추가
    public void insertReview(ReviewDto reviewDto)
    {
        reviewMapperInter.insertReview(reviewDto);
    }



}
