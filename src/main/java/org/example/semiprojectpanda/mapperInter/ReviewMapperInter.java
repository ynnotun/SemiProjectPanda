package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ReviewDto;

@Mapper
public interface ReviewMapperInter {

    //리뷰 추가
    @Insert("""
        insert into REVIEW (reviewreceiveuser, reviewsenduser, productnum, reviewstar, reviewcontent)
          values (#{reviewreceiveuser}, #{reviewsenduser}, #{productnum}, #{reviewstar}, #{reviewcontent})
      """)
    public void insertReview(ReviewDto reviewDto);

    // 평점 반환
    @Select("SELECT avg(reviewstar) FROM REVIEW where reviewreceiveuser=#{usernum}")
    public String getStarByUsernum(int usernum);

    // 리뷰 카운트
    @Select("SELECT count(*) FROM REVIEW where reviewreceiveuser=#{usernum}")
    public int getCountReviews(int usernum);


}
