package org.example.semiprojectpanda.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MailDto {

    private String email;
    private String message;

    @Override
    public String toString() {
        return "MailDto(email=" + email + ", message=" + message + ")";
    }
}
