package com.myshop.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.myshop.common.bo.OAuthBO;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@RestController
@RequestMapping("/oauth")
public class OAuthRestController {
	@Autowired
	private OAuthBO oauthBO;
	
	@ResponseBody
    @GetMapping("/kakao/login")
    public void kakaoCallback(@RequestParam("code") String code) {
        // return code;	// 인가 코드
        
//        return oauthBO.getKakaoAccessToken(code);
		
		String access_Token = oauthBO.getKakaoAccessToken(code);
		
		
		String reqest_URL = "https://kapi.kakao.com/v2/user/me";

		// access_token을 이용하여 사용자 정보 조회
		try {
			URL url = new URL(reqest_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			conn.setRequestProperty("Authorization", "Bearer " + access_Token); // 전송할 header 작성, access_token전송

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonElement element = JsonParser.parseString(result);

			boolean hasEmail = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("has_email")
					.getAsBoolean();
			String email = "";
			if (hasEmail) {
				email = element.getAsJsonObject().get("kakao_account").getAsJsonObject().get("email").getAsString();
			}

			String name = element.getAsJsonObject().get("properties").getAsJsonObject().get("nickname").getAsString();
			String id = email.split("@")[0];
			System.out.println("id : " + id);
			System.out.println("email : " + email);
			System.out.println("name : " + name);
			
			br.close();

		} catch (IOException e) {
			e.printStackTrace();
		}
    }
}
