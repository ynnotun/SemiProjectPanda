package org.example.semiprojectpanda.dto;

import lombok.Data;

@Data
public class MailDto {

    private String email;
    private String message;

    @Override
    public String toString() {
        return "MailDto(email=" + email + ", message=" + message + ")";
    }
}
