package org.example.semiprojectpanda.service;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.mapperInter.ReviewMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductMapperInter productMapperInter;

    @Autowired
    private ReviewMapperInter reviewMapperInter;

    public List<ProductDto> getSellList(int usernum){
        return productMapperInter.getSellList(usernum);
    }

    public List<ProductDto> getBuyList(int customernum){
        return productMapperInter.getBuyList(customernum);
    }

    public List<ProductDto> getSearchList(String keyword){
        return productMapperInter.getSearchList(keyword);
    }

    public List<ProductDto> getFourFromSellList(int usernum) {
        return productMapperInter.getFourFromSellList(usernum);
    }

    public List<ProductDto> getFourFromBuyList(int customernum) {
        return productMapperInter.getFourFromBuyList(customernum);
    }

    public double getStarByUsernum(int usernum){
        return reviewMapperInter.getStarByUsernum(usernum);
    }
}
