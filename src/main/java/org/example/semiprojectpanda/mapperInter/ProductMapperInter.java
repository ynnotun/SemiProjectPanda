package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.example.semiprojectpanda.dto.ProductDto;

import java.util.List;

@Mapper
public interface ProductMapperInter {
    //판매내역 불러오기
    @Select("select * from product where usernum=#{usernum} ") //url에 ?usernum=1 ->파라미터(매개변수)를 받아온다.
    public List<ProductDto> getSellList(int usernum); //자바에서 어떤 이름으로 불러올지 메소드 이름 선정

    //구매내역 불러오기
    @Select("select * from product where customernum=#{customernum}")
    public List<ProductDto> getBuyList(int customernum);
}
