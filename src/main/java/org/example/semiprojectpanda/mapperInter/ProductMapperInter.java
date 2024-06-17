package org.example.semiprojectpanda.mapperInter;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.example.semiprojectpanda.dto.ProductDto;

@Mapper
public interface ProductMapperInter {

    //product 추가
    @Insert("""
        insert into PRODUCT (usernum, producttitle, productcontent, productprice, productaddress, categorynum, productcreatedat, productopenchat, productlocationx, productlocationy)
          values (#{usernum}, #{producttitle}, #{productcontent}, #{productprice}, #{productaddress}, #{categorynum}, now(), #{productopenchat}, #{productlocationx}, #{productlocationy})
      """)
    void insertProduct(ProductDto productDto);

    @Select("SELECT * FROM PRODUCT WHERE productnum = #{productnum}")
    ProductDto getProductByProductnum(int productnum);

    @Update("""
            UPDATE PRODUCT
            SET customernum = #{customernum}, productstatus = #{productstatus}
            WHERE productnum = #{productnum};
            """)
    void updateProductStatusAndCustomer(ProductDto productDto);

//    //판매내역 불러오기
//    @Select("select * from PRODUCT where usernum=#{usernum} ") //url에 ?usernum=1 ->파라미터(매개변수)를 받아온다.
//    public List<ProductDto> getSellList(int usernum); //자바에서 어떤 이름으로 불러올지 메소드 이름 선정
//
//    //구매내역 불러오기
//    @Select("select * from PRODUCT where customernum=#{customernum}")
//    public List<ProductDto> getBuyList(int customernum);
}
