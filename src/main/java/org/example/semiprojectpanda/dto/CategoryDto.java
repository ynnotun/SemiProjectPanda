package org.example.semiprojectpanda.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class CategoryDto {
    private int categorynum;
    private String categoryname;
    private String categoryicon;
}
