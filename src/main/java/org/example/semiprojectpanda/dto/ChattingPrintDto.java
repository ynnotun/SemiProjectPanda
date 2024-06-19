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
public class ChattingPrintDto {
    private int chattingnum;
    private int sendusernum;
    private String usernickname;
    private String userprofileimage;
    private int chatroomnum;
    private String chattingmessage;
    private Timestamp chattingcreatedat;
}
