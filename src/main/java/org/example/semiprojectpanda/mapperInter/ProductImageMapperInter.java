package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.ProductImageDto;

import java.util.List;

@Mapper
public interface ProductImageMapperInter {
    @Select("SELECT * FROM PRODUCT_IMAGE WHERE productnum = #{productnum}")
    List<ProductImageDto> findImageByProductnum(int productnum);
}
