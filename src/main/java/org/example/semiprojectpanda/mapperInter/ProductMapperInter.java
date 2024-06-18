package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.*;
import org.example.semiprojectpanda.dto.ProductDto;

import java.util.List;

@Mapper
public interface ProductMapperInter {

    //상품의 최초 등록
    @Insert("""
        INSERT INTO PRODUCT (usernum, producttitle, productcontent, productprice, productaddress, categorynum, productcreatedat, productopenchat, productlocationx, productlocationy)
          VALUES (#{usernum}, #{producttitle}, #{productcontent}, #{productprice}, #{productaddress}, #{categorynum}, now(), #{productopenchat}, #{productlocationx}, #{productlocationy})
      """)
    @Options(useGeneratedKeys = true, keyProperty = "productnum")//지금 추가된 productnum
    void insertProduct(ProductDto productDto);

    //상품의 내용 수정
    @Update("""
            
            """)
    void updateProduct(ProductDto productDto);
    
    //상품번호로 상품 정보 불러오기
    @Select("SELECT * FROM PRODUCT WHERE productnum = #{productnum}")
    ProductDto getProductByProductnum(int productnum);
    
    //상품의 거래 상태 갱신
    @Update("""
            UPDATE PRODUCT
            SET customernum = #{customernum}, productstatus = #{productstatus}
            WHERE productnum = #{productnum};
            """)
    void updateProductStatusAndCustomer(ProductDto productDto);

    //판매내역 불러오기
    @Select("select * from PRODUCT where usernum=#{usernum} ") //url에 ?usernum=1 ->파라미터(매개변수)를 받아온다.
    public List<ProductDto> getSellList(int usernum); //자바에서 어떤 이름으로 불러올지 메소드 이름 선정

    //구매내역 불러오기
    @Select("select * from PRODUCT where customernum=#{customernum}")
    public List<ProductDto> getBuyList(int customernum);
}
