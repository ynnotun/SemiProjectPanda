package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ProductDto;

@Mapper
public interface HashtagMapperInter {

    //hashtag 추가
    @Insert("""
        insert into HASHTAG (hashtagname, productnum)
          values (#{hashtagname}, #{productnum})
      """)
    void insertHashTag(HashtagDto hashtagDto);



}
