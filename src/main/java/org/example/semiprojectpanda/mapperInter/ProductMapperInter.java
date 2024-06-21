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
    @Options(useGeneratedKeys = true, keyProperty = "productnum")//지금 추가된 productnum 구하기
    void insertProduct(ProductDto productDto);

    //상품의 내용 수정
    @Update("""
            UPDATE PRODUCT 
            set producttitle = #{producttitle}, productcontent = #{productcontent}, productprice = #{productprice}, productaddress = #{productaddress}, 
                   categorynum = #{categorynum}, productopenchat = #{productopenchat}, productlocationx = #{productlocationx}, productlocationy = #{productlocationy} 
            where productnum = #{productnum}
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
    @Select("""
    SELECT p.* , i.imagefilename
            FROM PRODUCT p
            JOIN (
                SELECT productnum, MIN(imagefilename) as imagefilename
                FROM PRODUCT_IMAGE
                GROUP BY productnum
            ) i ON i.productnum = p.productnum
            WHERE p.usernum = #{usernum}
            order by productnum""") //url에 ?usernum=1 ->파라미터(매개변수)를 받아온다.
    public List<ProductDto> getSellList(int usernum); //자바에서 어떤 이름으로 불러올지 메소드 이름 선정

    //구매내역 불러오기
    @Select("""
        SELECT p.* , i.imagefilename
            FROM PRODUCT p
            JOIN (
                SELECT productnum, MIN(imagefilename) as imagefilename
                FROM PRODUCT_IMAGE
                GROUP BY productnum
            ) i ON i.productnum = p.productnum
            WHERE p.customernum = #{customernum}
            order by productnum""")
    public List<ProductDto> getBuyList(int customernum);


    //검색 결과 불러오기
    @Select("""
            SELECT p.* , i.imagefilename as imagefilename
            FROM PRODUCT p
            JOIN (
                SELECT productnum, MIN(imagefilename) as imagefilename
                FROM PRODUCT_IMAGE
                GROUP BY productnum
            ) i ON i.productnum = p.productnum
            WHERE producttitle LIKE CONCAT('%',#{keyword},'%') OR productaddress LIKE CONCAT('%',#{keyword},'%') ORDER BY productcreatedat desc""")
    List<ProductDto> getSearchList(@Param("keyword") String keyword);

    //판매내역 최신순으로 4개만 불러오기
    @Select("""
            SELECT p.* , i.imagefilename
            FROM PRODUCT p
            JOIN (
                SELECT productnum, MIN(imagefilename) as imagefilename
                FROM PRODUCT_IMAGE
                GROUP BY productnum
            ) i ON i.productnum = p.productnum
            WHERE p.usernum = #{usernum}
            order by productnum desc LIMIT 0, 4
            """)
    public List<ProductDto> getFourFromSellList(int usernum);

    //구매내역 최신순으로 4개만 불러오기
    @Select("""
            SELECT p.* , i.imagefilename
            FROM PRODUCT p
            JOIN (
                SELECT productnum, MIN(imagefilename) as imagefilename
                FROM PRODUCT_IMAGE
                GROUP BY productnum
            ) i ON i.productnum = p.productnum
            WHERE p.customernum = #{customernum}
            order by productnum desc LIMIT 0, 4""")
    public List<ProductDto> getFourFromBuyList(int customernum);


    // 카테고리로 제품 받아오기
    @Select("""
            SELECT p.* , i.imagefilename
            FROM PRODUCT p
            JOIN (
                SELECT productnum, MIN(imagefilename) as imagefilename
                FROM PRODUCT_IMAGE
                GROUP BY productnum
            ) i ON i.productnum = p.productnum
            ORDER BY p.PRODUCTNUM DESC""")
    public List<ProductDto> getAllProduct();

    // 카테고리로 제품 받아오기
    /*@Select("SELECT * FROM PRODUCT WHERE categorynum = #{categorynum} ORDER BY PRODUCTNUM DESC")*/
    @Select("""
        SELECT p.* , i.imagefilename
            FROM PRODUCT p
            JOIN (
                SELECT productnum, MIN(imagefilename) as imagefilename
                FROM PRODUCT_IMAGE
                GROUP BY productnum
            ) i ON i.productnum = p.productnum
            WHERE p.categorynum = #{categorynum}
            ORDER BY p.PRODUCTNUM DESC
        """)
    public List<ProductDto> getAllProductByCategorynum(int categorynum);
}

