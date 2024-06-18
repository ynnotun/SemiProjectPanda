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

    //리뷰 추가
    public void insertReview(ReviewDto reviewDto)
    {
        reviewMapperInter.insertReview(reviewDto);
    }



}
