package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.CategoryDto;

import java.util.List;

@Mapper
public interface CategoryMapperInter {
    @Select("SELECT * FROM CATEGORY")
    List<CategoryDto> getAllCategories();
}
