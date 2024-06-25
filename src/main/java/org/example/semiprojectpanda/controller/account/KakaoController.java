package org.example.semiprojectpanda.controller.account;

import org.example.semiprojectpanda.dto.OAuthToken;
import org.example.semiprojectpanda.dto.KakaoProfile;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/kakao")
public class KakaoController {

    @GetMapping("")
    public String kakao() {
        return "account/kakao";
    }

    @GetMapping("/code")
    @ResponseBody
    public String getCode(@RequestParam String code) {
        String accessToken = getAccessToken(code);
        if (accessToken != null) {
            return "액세스 토큰 : " + accessToken;
        } else {
            return "액세스 토큰을 가져올 수 없습니다.";
        }
    }

    private String getAccessToken(String code) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "5453e845f3bfe0528d93713e153531c3");
        params.add("redirect_uri", "http://localhost:9000/kakao/code");
        params.add("code", code);
        params.add("client_secret", "YOUR_CLIENT_SECRET");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<OAuthToken> response = restTemplate.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                request,
                OAuthToken.class
        );

        OAuthToken token = response.getBody();
        return token != null ? token.getAccess_token() : null;
    }

    @GetMapping("/auth")
    @ResponseBody
    public String auth(@RequestParam String code) {
        String accessToken = getAccessToken(code);
        if (accessToken != null) {
            KakaoProfile profile = getKakaoProfile(accessToken);
            if (profile != null && profile.getKakaoAccount() != null) {
                return "이메일: " + profile.getKakaoAccount().getEmail();
            } else {
                return "사용자 정보를 가져올 수 없습니다.";
            }
        } else {
            return "액세스 토큰을 가져올 수 없습니다.";
        }
    }

    private KakaoProfile getKakaoProfile(String accessToken) {
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<Void> profileRequest = new HttpEntity<>(headers);
        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<KakaoProfile> profileResponse = restTemplate.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                profileRequest,
                KakaoProfile.class
        );

        if (profileResponse.getStatusCode().is2xxSuccessful()) {
            return profileResponse.getBody();
        } else {
            System.out.println("Error: " + profileResponse.getStatusCode());
            System.out.println("Response: " + profileResponse.getBody());
            return null;
        }
    }
}
