package org.example.semiprojectpanda.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class ChatroomDto {
    private Integer chatroomnum;
    private String chatroomname;
    private Integer productnum;
    private Integer applyusernum;
    private Integer productusernum;
}
