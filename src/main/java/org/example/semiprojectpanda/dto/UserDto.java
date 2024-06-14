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
public class UserDto {
    private int usernum;
    private String useremail;
    private String userpassword;
    private String username;
    private String usernickname;
    private String userprofileimage;
    private String useraddress;
    private String userphonenumber;
    private String userbirthday;
    private Timestamp usercreatedate;
}
