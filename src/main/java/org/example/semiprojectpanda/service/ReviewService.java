package org.example.semiprojectpanda.service;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.mapperInter.ReviewMapperInter;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ReviewService {
    @NonNull
    private final ReviewMapperInter reviewMapperInter;

    // 평점 얻기
    public String getStarByUsernum(int usernum){
        return reviewMapperInter.getStarByUsernum(usernum);
    }
}
