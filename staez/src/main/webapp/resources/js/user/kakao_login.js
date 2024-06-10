import config from './config.js';
// 카카오 로그인 설정
window.onload = function() {
    const kakaoClientId = config.kakaoClientId;
    // 리다이렉트 URI를 UTF-8로 인코딩(encodeURIComponent)해서 저장
    const redirectURI = encodeURIComponent("http://localhost:8888/staez/kakao-login")

    //CSRF 방지 토큰이나 OAuth 2.0의 상태 파라미터 등 다양한 보안 및 고유 식별 용도
    const state = Math.random().toString(36).substring(2);

    //로그인 api url
    const apiURL = 'https://kauth.kakao.com/oauth/authorize?response_type=code&'
        + 'client_id=' + kakaoClientId + "&redirect_uri=" +  redirectURI + '&state=' + state;

    const loginBtn = document.getElementById('kakaoLoginLink');
    loginBtn.href = apiURL;
    }