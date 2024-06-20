package org.example.semiprojectpanda.service;


import lombok.RequiredArgsConstructor;
import org.example.semiprojectpanda.dto.ProductDto;
import org.example.semiprojectpanda.mapperInter.CategoryMapperInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MainService {
    @Autowired
    private CategoryMapperInter categoryMapper;

    public List<ProductDto> getProductsByPage(int pagenum, int endnum){
        return categoryMapper.getProductsByPage(pagenum, endnum);
    }
}
