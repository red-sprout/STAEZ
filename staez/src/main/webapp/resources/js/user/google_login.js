import config from './config.js';
// 구글로그인설정
window.onload = function() {
    const googleClientId = config.googleClientId;
    const googleRedirectURI = encodeURIComponent("http://localhost:8888/staez/google-login");
    const googleState = Math.random().toString(36).substring(2);
    const googleApiURL = 'https://accounts.google.com/o/oauth2/auth?response_type=code&'
        + 'client_id=' + googleClientId + "&redirect_uri=" + googleRedirectURI + '&state=' + googleState
        + '&scope=email%20profile';  // scope 추가
    const googleLoginBtn = document.getElementById('googleLoginLink');
    if (googleLoginBtn) {
        googleLoginBtn.href = googleApiURL;
    } else {
        console.log("구글 로그인 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }
}

