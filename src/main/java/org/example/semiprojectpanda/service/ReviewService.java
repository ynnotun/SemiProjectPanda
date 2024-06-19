package org.example.semiprojectpanda.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ReviewDto;
import org.example.semiprojectpanda.mapperInter.ReviewMapperInter;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReviewService {
    @NonNull
    private final ReviewMapperInter reviewMapperInter;

    // 평점 얻기
    public Double getStarByUsernum(int usernum){
        return reviewMapperInter.getStarByUsernum(usernum);
    }

    // 리뷰 개수 얻기
    public int getCountReviews(int usernum){
        return reviewMapperInter.getCountReviews(usernum);
    }

    // 리뷰 출력
    public List<ReviewDto> getReviewsByUsernum(int usernum){
        return reviewMapperInter.getReviewsByUsernum(usernum);
    }

    // 등급 출력
    public String getGradeByUsernum(int usernum){
        return reviewMapperInter.getGradeByUsernum(usernum);
    }
}
