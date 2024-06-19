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
    @Select("SELECT avg(reviewstar) result FROM REVIEW where reviewreceiveuser=#{usernum}")
    public double getStarByUsernum(int usernum);

}
