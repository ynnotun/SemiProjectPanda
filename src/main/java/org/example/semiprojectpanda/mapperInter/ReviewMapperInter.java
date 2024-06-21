package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ReviewDto;

import java.util.List;

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
    public Double getStarByUsernum(int usernum);

    // 리뷰 카운트
    @Select("SELECT count(*) FROM REVIEW where reviewreceiveuser=#{usernum}")
    public int getCountReviews(int usernum);

    // 리뷰 출력
    @Select("""
            SELECT U.username AS username, U.userprofileimage AS userimage, R.* FROM REVIEW R 
                JOIN USER U ON R.reviewsenduser = U.usernum where R.reviewreceiveuser = #{usernum}
            """)
    public List<ReviewDto> getReviewsByUsernum(int usernum);

    // 등급 출력
    @Select("""
            SELECT
                CASE
                    WHEN COUNT(*) >= 10 AND AVG(reviewstar) >= 3.7 THEN 'good'
                    WHEN COUNT(*) >= 3 AND AVG(reviewstar) <= 2.0 THEN 'bad'
                    ELSE 'normal'
                END AS review_status
            FROM
                REVIEW
            where reviewreceiveuser = #{usernum}
            """)
    public String getGradeByUsernum(int usernum);

}
