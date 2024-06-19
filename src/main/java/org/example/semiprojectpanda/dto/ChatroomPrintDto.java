package org.example.semiprojectpanda.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@Builder
@AllArgsConstructor
public class ChatroomPrintDto {
    private int chatroomnum;
    private String chatroomname;
    private String productaddress;
    private String applyusernickname;
    private String applyprofile;

}
