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
    private Integer usernum;
    private Integer customernum;
    private String producttitle;
    private String productcontent;
    private int productprice;
    private String productaddress;
    private int categorynum;
    private int productreadcount;
    private String productstatus;
    private Timestamp productcreatedat;
    private String productopenchat;
    private double productlocationx;
    private double productlocationy;
    private String imagefilename;
}
