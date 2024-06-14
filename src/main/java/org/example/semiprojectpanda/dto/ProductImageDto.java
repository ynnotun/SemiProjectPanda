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
public class ProductImageDto {
    private int imagenum;
    private int productnum;
    private String imagefilename;
}
