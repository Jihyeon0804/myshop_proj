package com.myshop.naver.bo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class NaverBO {
	
	public String getAccessToken(String authorize_code) {
		Logger logger = LoggerFactory.getLogger(this.getClass());

		String access_Token = "";
		String requestUrl = "https://nid.naver.com/oauth2.0/token";

		try {
			URL url = new URL(requestUrl);

			HttpURLConnection conn = (HttpURLConnection)url.openConnection();

			conn.setRequestMethod("POST");
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			SecureRandom random = new SecureRandom();
			String state = new BigInteger(130, random).toString();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=vD9bvsK1LSuUMv2nK4i9"); // 발급받은 id 키
			sb.append("&client_secret=yA06LJETzh"); // 발급받은 secret 키
			sb.append("&code=" + authorize_code);
			sb.append("&state=" + state);
			sb.append("&redirect_uri=http://localhost/naver/login/result"); // redirect uri

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

			logger.info("%%%%%%%%%%% access_token : {}", access_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
	}
	
	
	public Map<String, Object> getUserInfo(String access_Token) {
		Logger logger = LoggerFactory.getLogger(this.getClass());
	
		Map<String, Object> userInfo = new HashMap<>();
		String reqURL = "https://openapi.naver.com/v1/nid/me";
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
			
			JsonObject response = element.getAsJsonObject().get("response").getAsJsonObject();
			
			String name = response.getAsJsonObject().get("name").getAsString();
			String email = response.getAsJsonObject().get("email").getAsString();
			String phoneNumber = response.getAsJsonObject().get("mobile").getAsString();
	
			String id = email.split("@")[0];
			userInfo.put("loginId", id);
			userInfo.put("name", name);
			userInfo.put("email", email);
			userInfo.put("phoneNumber", phoneNumber);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return userInfo;
	}
}
