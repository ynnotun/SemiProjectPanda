package org.example.semiprojectpanda.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class ProductDto {
    private int productnum;
    private int usernum;
    private Integer customernum;
    private String producttitle;
    private String productcontent;
    private int productprice;
    private String productaddress;
    private int categorynum;
    private int productreadcount;
    private String productstatus;
    private Timestamp productcreatedat;
    // productcreatedat 오타
    private String productopenchat;
    private double productlocationx;
    private double productlocationy;
}
