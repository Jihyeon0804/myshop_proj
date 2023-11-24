package com.myshop.kakao.bo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class KaKaoBO {

	public String getAccessToken (String authorize_code) {
		
		Logger logger = LoggerFactory.getLogger(this.getClass());
		
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
			conn.setRequestMethod("POST");
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setDoOutput(true);
            
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=5fe0b7f721365d472ac1462d40d94415"); // rest api key
			sb.append("&redirect_uri=http://localhost/kakao/login/result"); // redirect uri
            
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			logger.info("########### responseCode : {}", responseCode);
            
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			logger.info("$$$$$$$$$$$$$$$$$$ responseBody : {}", result);
            
			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonElement element = (JsonObject) JsonParser.parseString(result.toString());
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			
			logger.info("%%%%%%%%%%% access_token : {}", access_Token);
			logger.info("%%%%%%%%%%% refresh_token : {}", refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	/**
	 * 사용자 정보 가져오기
	 * @param access_Token
	 * @return
	 */
	public Map<String, Object> getUserInfo(String access_Token) {
		Logger logger = LoggerFactory.getLogger(this.getClass());

		Map<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			logger.info("@@@@@@@@@@@ responseCode : {}", responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			logger.info("&&&&&&&&&&&&&& responseBody : {}", result);

			JsonElement element = (JsonObject) JsonParser.parseString(result.toString());

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String name = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			String id = email.split("@")[0];
			userInfo.put("loginId", id);
			userInfo.put("name", name);
			userInfo.put("email", email);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
}
