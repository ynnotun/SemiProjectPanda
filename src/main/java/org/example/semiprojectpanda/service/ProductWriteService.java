package org.example.semiprojectpanda.service;

import lombok.NonNull;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;

//콩비 추가 : 24/06/14_15:05 version.1
public class ProductWriteService {
    @NonNull
    private ProductMapperInter productMapper;
    public void insertProduct(ProductDto productDto)
    {
        productMapper.insertProduct(productDto);
    }
}
