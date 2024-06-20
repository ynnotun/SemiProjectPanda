package org.example.semiprojectpanda.service;

import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.ProductMapperInter;
import org.example.semiprojectpanda.mapperInter.ReviewMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ProductService {
    @Autowired
    private ProductMapperInter productMapperInter;

    @Autowired
    private ReviewMapperInter reviewMapperInter;

    public List<ProductDto> getSellList(int usernum) {
        return productMapperInter.getSellList(usernum);
    }

    public List<ProductDto> getBuyList(int customernum) {
        return productMapperInter.getBuyList(customernum);
    }

    public List<ProductDto> getSearchList(List<String> keywords) {
        List<List<ProductDto>> productsByKeyword = new ArrayList<>();

        for (String keyword : keywords) {
            List<ProductDto> products = productMapperInter.getSearchList(keyword);
            productsByKeyword.add(products);
        }

        List<ProductDto> duplicates = new ArrayList<>();
        List<ProductDto> unique = new ArrayList<>();
        Set<ProductDto> products = new HashSet<>();

        for (List<ProductDto> productsByKeywordd : productsByKeyword) {
            for (ProductDto product : productsByKeywordd) {
                if (!products.add(product)) {
                    duplicates.add(product);
                } else {
                    unique.add(product);
                }
            }
        }

        duplicates.addAll(unique);

        // 중복 제거 후 return
        return new ArrayList<>(new LinkedHashSet<>(duplicates));
    }

    public List<ProductDto> getFourFromSellList(int usernum) {
        return productMapperInter.getFourFromSellList(usernum);
    }

    public List<ProductDto> getFourFromBuyList(int customernum) {
        return productMapperInter.getFourFromBuyList(customernum);
    }

}
