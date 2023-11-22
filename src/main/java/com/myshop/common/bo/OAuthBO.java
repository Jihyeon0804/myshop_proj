package com.myshop.common.bo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class OAuthBO {

	public String getKakaoAccessToken(String code) {
		String access_Token = "";
		String refresh_Token = "";
		String request_URL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(request_URL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=5fe0b7f721365d472ac1462d40d94415"); // REST_API_KEY 입력
			sb.append("&redirect_uri=http://localhost/oauth/kakao/login"); // 인가코드 받은 redirect_uri 입력
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

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

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return access_Token;
//        responseCode : 200
//        response body : {"access_token":"H02f6qM3dvsXELbWyW2Y2VkAlJblZlvvapIKPXUaAAABi_VgtB6BPKUF0hG4dQ","token_type":"bearer","refresh_token":"Z3yko4rvMn0nTtGBPjYz4FEDJVYxZn2DLDAKPXUaAAABi_VgtBqBPKUF0hG4dQ","expires_in":21599,"scope":"account_email talk_message profile_nickname","refresh_token_expires_in":5183999}
//        access_token : H02f6qM3dvsXELbWyW2Y2VkAlJblZlvvapIKPXUaAAABi_VgtB6BPKUF0hG4dQ
//        refresh_token : Z3yko4rvMn0nTtGBPjYz4FEDJVYxZn2DLDAKPXUaAAABi_VgtBqBPKUF0hG4dQ
	}

}
