package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.ProductDto;

@Mapper
public interface ProductMapperInter {
    public void insertProduct(ProductDto productDto);//상품 추가
}
