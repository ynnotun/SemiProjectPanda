package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.dto.ProductImageDto;

import java.util.List;

@Mapper
public interface ProductImageMapperInter {

    //productImage 추가
    @Insert("""
        INSERT INTO PRODUCT_IMAGE (productnum, imagefilename)
          VALUES (#{productnum}, #{imagefilename})
      """)
    void insertProductImage(ProductImageDto productImageDto);

    //productImage 삭제
    @Delete("""
        DELETE FROM PRODUCT_IMAGE WHERE productnum = #{productnum}
    """)
    void deleteProductImageByProductnum(int productnum);


    @Select("SELECT * FROM PRODUCT_IMAGE WHERE productnum = #{productnum}")
    List<ProductImageDto> findImageByProductnum(int productnum);
}
