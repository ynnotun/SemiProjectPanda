package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.CategoryDto;
import org.example.semiprojectpanda.dto.ProductDto;

import java.util.List;

@Mapper
public interface CategoryMapperInter {
    @Select("SELECT * FROM CATEGORY")
    List<CategoryDto> getAllCategories();

    @Select("SELECT * FROM PRODUCT LIMIT #{pagenum},#{endnum}")
    public List<ProductDto> getProductsByPage(int pagenum, int endnum);
}
