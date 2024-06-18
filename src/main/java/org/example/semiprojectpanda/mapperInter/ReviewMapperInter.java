package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ReviewDto;

@Mapper
public interface ReviewMapperInter {
    @Insert("""
        insert into REVIEW (reviewreceiveuser, reviewsenduser, productnum, reviewstar, reviewcontent)
          values (#{reviewreceiveuser}, #{reviewsenduser}, #{productnum}, #{reviewstar}, #{reviewcontent})
      """)
    public void insertReview(ReviewDto reviewDto);
}
