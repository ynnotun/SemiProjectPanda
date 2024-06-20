package org.example.semiprojectpanda.service;


import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.CategoryMapperInter;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainService {
    @Autowired
    private CategoryMapperInter categoryMapper;
    @Autowired
    private ProductMapperInter ProductMapperInter;

    public List<ProductDto> getProductsByPage(int pagenum, int endnum){
        return categoryMapper.getProductsByPage(pagenum, endnum);
    }

    public List<ProductDto> getAllProduct(){
        return ProductMapperInter.getAllProduct();
    }

    public List<ProductDto> getAllProductByCategorynum(int categorynum){
        return ProductMapperInter.getAllProductByCategorynum(categorynum);
    }
}
