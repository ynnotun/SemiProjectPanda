package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
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


}
