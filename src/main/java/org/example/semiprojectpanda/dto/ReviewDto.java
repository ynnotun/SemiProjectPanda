package org.example.semiprojectpanda.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class ReviewDto {
    private int reviewnum;
    private int reviewreceiveuser;
    private int reviewsenduser;
    private int productnum;
    private double reviewstar;
    private String reviewcontent;
}
