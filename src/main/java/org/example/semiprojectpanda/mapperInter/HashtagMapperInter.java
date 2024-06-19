package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
import org.example.semiprojectpanda.dto.HashtagDto;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;

import java.util.List;

@Mapper
public interface HashtagMapperInter {

    //hashtag 추가
    @Insert("""
        INSERT INTO HASHTAG (hashtagname, productnum)
          VALUES (#{hashtagname}, #{productnum})
      """)
    void insertHashTag(HashtagDto hashtagDto);

    //해시태그 추출
    @Select("""
            SELECT * FROM HASHTAG WHERE productnum = #{productnum}
    """)
    List<HashtagDto> findHashtagByProductnum(int productnum);

    //해시태그 삭제
    @Delete("""
        DELETE FROM HASHTAG WHERE productnum = #{productnum}
    """)
    void deleteHashtagByProductnum(int productnum);
    
    
    
}
