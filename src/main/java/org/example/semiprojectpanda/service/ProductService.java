package org.example.semiprojectpanda.service;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductMapperInter productMapperInter;

    public List<ProductDto> getSellList(int usernum){
        return productMapperInter.getSellList(usernum);
    }

    public List<ProductDto> getBuyList(int customernum){
        return productMapperInter.getBuyList(customernum);
    }

    public List<ProductDto> getSearchList(List<String> keyword) {
        return productMapperInter.getSearchList(keyword);
    }
}
