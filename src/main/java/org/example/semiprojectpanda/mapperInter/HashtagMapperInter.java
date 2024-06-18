package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ProductDto;

@Mapper
public interface HashtagMapperInter {

    //hashtag 추가
    @Insert("""
        INSERT INTO HASHTAG (hashtagname, productnum)
          VALUES (#{hashtagname}, #{productnum})
      """)
    void insertHashTag(HashtagDto hashtagDto);

    //hashtag 수정
    /*@Update("""

    """)
    void updateHashTag(HashtagDto hashtagDto);*/

    //hashtag 전부 호출
/*    @Select("""
    """)
    void getallHashtag();
    */
}
