package com.spring.staez.user.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.staez.user.model.vo.User;
import com.spring.staez.user.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//로그인
	@PostMapping("login.me")
	public String loginUser(User u, HttpSession session) {
		User loginUser = userService.loginUser(u);
		if(loginUser == null || !bcryptPasswordEncoder.matches(u.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("alertMsg", "아이디 또는 패스워드가 일치하지 않습니다.");
			return "user/loginForm";
		} else {
			session.setAttribute("loginUser", loginUser);			
			return "redirect:/";
		}
	}
	
	//로그아웃
	@GetMapping("logout.me")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("loginUser");
		return "redirect:/";
	}
	
	// 네이버 로그인
	@RequestMapping("/naver-login")
	public String naverLoginCallback(HttpServletRequest request, HttpSession session) {
		
		String naverClientId = "qmp5nqG9EBf9YYN33GKV";
		String naverClientSecret = "B1jP8E7xaK";
		String navercode = request.getParameter("code");
		String naverState = request.getParameter("state");
		
		
		try {
			String redirectURI = URLEncoder.encode("http://localhost:8888/staez/naver-login", "UTF-8");
			String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
			apiURL += "&client_id=" + naverClientId;
			apiURL += "&client_secret=" + naverClientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + navercode;
			apiURL += "&state=" + naverState;
			
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			//HTTP요청에 대한 응답코드 확인
			int responseCode = con.getResponseCode();
			
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			//응답데이터를 읽어온다.
			String inputLine;
			StringBuffer res = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			
			if (responseCode == 200) {
				//정상적으로 정보를 받아왔을 때 result에 정보를 저장
				String result = res.toString();
				//System.out.println("result" + result);
				
				JsonObject totalObj = JsonParser.parseString(result).getAsJsonObject();
				//System.out.println("totalObj" + totalObj.get("access_token"));
				
				String token = totalObj.get("access_token").getAsString(); //정보접근을 위한 토큰
				String header = "Bearer " + token;
				
				apiURL = "https://openapi.naver.com/v1/nid/me";
				Map<String, String> requestHeaders = new HashMap<String, String>();
				requestHeaders.put("Authorization", header);
				
				String responseBody = get(apiURL, requestHeaders);
				
				JsonObject memberInfo = JsonParser.parseString(responseBody).getAsJsonObject();
				JsonObject resObj = memberInfo.getAsJsonObject("response");
				
				System.out.println("resObj : " + resObj);
				//받아온 email과 데이터베이스의 email을 비교하여 가입유무 확인 후
				//가입되어있다면 로그인, 아니라면 회원가입창으로 정보를 가지고 이동
				
				 String email = resObj.get("email").getAsString();

                // 이메일로 사용자 검색
                User user = userService.findUserByEmail(email);
                if (user != null) {
                    // 사용자가 존재하면 로그인 처리
                    session.setAttribute("loginUser", user);
                    return "redirect:/";
                } else {
                    // 사용자가 존재하지 않으면 회원가입 페이지로 이동
                    //session.setAttribute("naverUser", resObj);
                    return "redirect:/insertForm.me";
                }
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/";
		
	}
	
	// 카카오 로그인
	@RequestMapping("/kakao-login")
	public String kakaoLoginCallback(HttpServletRequest request, HttpSession session) {
		
		String kakaoClientId = "3d0c80afec61216e697bdf6104040191";
		String kakaoClientSecret = "vn3AJL3vm0WwxTmZbuT5FeTglFpiSlUW";
		String kakaoCode = request.getParameter("code");
		
		
		try {
            String redirectURI = URLEncoder.encode("http://localhost:8888/staez/kakao-login", "UTF-8");

            // 액세스 토큰 요청 URL
            String tokenRequestUrl = "https://kauth.kakao.com/oauth/token";

            URL url = new URL(tokenRequestUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            String postParams = "grant_type=authorization_code"
                    + "&client_id=" + kakaoClientId
                    + "&redirect_uri=" + redirectURI
                    + "&code=" + kakaoCode
                    + "&client_secret=" + kakaoClientSecret;

            con.setDoOutput(true);
            OutputStream os = con.getOutputStream();
            os.write(postParams.getBytes());
            os.flush();
            os.close();

            int responseCode = con.getResponseCode();
            BufferedReader br = new BufferedReader(new InputStreamReader(responseCode == 200 ? con.getInputStream() : con.getErrorStream()));
            String inputLine;
            StringBuffer res = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();

            if (responseCode == 200) {
                String result = res.toString();
                JsonObject totalObj = JsonParser.parseString(result).getAsJsonObject();
                String token = totalObj.get("access_token").getAsString();

                // 사용자 정보 요청
                String userInfoUrl = "https://kapi.kakao.com/v2/user/me";
                URL userInfoUrlObj = new URL(userInfoUrl);
                HttpURLConnection userInfoCon = (HttpURLConnection) userInfoUrlObj.openConnection();
                userInfoCon.setRequestMethod("GET");
                userInfoCon.setRequestProperty("Authorization", "Bearer " + token);

                int userInfoResponseCode = userInfoCon.getResponseCode();
                BufferedReader userInfoBr = new BufferedReader(new InputStreamReader(userInfoResponseCode == 200 ? userInfoCon.getInputStream() : userInfoCon.getErrorStream()));
                String userInfoInputLine;
                StringBuffer userInfoRes = new StringBuffer();
                while ((userInfoInputLine = userInfoBr.readLine()) != null) {
                    userInfoRes.append(userInfoInputLine);
                }
                userInfoBr.close();

                if (userInfoResponseCode == 200) {
                    JsonObject userInfoObj = JsonParser.parseString(userInfoRes.toString()).getAsJsonObject();
                    JsonObject kakaoAccount = userInfoObj.getAsJsonObject("kakao_account");
                    String email = kakaoAccount.get("email").getAsString();

                    // 이메일로 사용자 검색
                    User user = userService.findUserByEmail(email);
                    if (user != null) {
                        // 사용자가 존재하면 로그인 처리
                        session.setAttribute("loginUser", user);
                        return "redirect:/";
                    } else {
                        // 사용자가 존재하지 않으면 회원가입 페이지로 이동
                        return "redirect:/insertForm.me";
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/";
    }
	
	//API에 GET요청 보내고 응답을 받아오는 메서드
	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection conn = connect(apiUrl);
		
		try {
			conn.setRequestMethod("GET");
			
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				conn.setRequestProperty(header.getKey(), header.getValue());
			}
			
			int responseCode = conn.getResponseCode();
			if(responseCode == 200) {
				return readBody(conn.getInputStream());
			} else {
				return readBody(conn.getErrorStream());
			}
			
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패. : " + apiUrl, e);
		} finally {
			conn.disconnect();
		}
	}
	
	//API에 연결하기위한 HttpURLConnection객체를 생성하고 반환하는 메서드
	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			e.printStackTrace();
			throw new RuntimeException("연결이 실패하였습니다. : " + apiUrl, e);
		} 
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);
		
		try (BufferedReader br = new BufferedReader(streamReader)){
			StringBuilder responseBody = new StringBuilder();
			
			String line;
			while((line = br.readLine()) != null) {
				responseBody.append(line);
			}
			
			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패하였습니다.", e);
		}
		
	}
	
}