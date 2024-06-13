import config from './config.js';
document.addEventListener('DOMContentLoaded', function() {
    // 아이디 찾기 버튼
    findIdButton();
    // 비밀번호 찾기 버튼
    findPwdButton();
    // 회원가입 버튼
    insertButton();
    // 네이버 간편로그인
    naverLogin();
    // 카카오 간편로그인
    kakaoLogin();
    // 구글 간편로그인
    googleLogin();
});

function findIdButton(){
    // 아이디 찾기 버튼
    var findIdButton = document.getElementById('findIdButton');
    if (findIdButton) {
        findIdButton.addEventListener('click', function() {
            window.location.href = 'findIdForm.me';
        });
    }
}

function findPwdButton(){
    // 비밀번호 찾기 버튼
    var findPwdButton = document.getElementById('findPwdButton');
    if (findPwdButton) {
        findPwdButton.addEventListener('click', function() {
            window.location.href = 'findPwdForm.me';
        });
    }
}

function insertButton(){
    // 회원가입 버튼
    var signinButton = document.getElementById('signinButton');
    if (signinButton) {
        signinButton.addEventListener('click', function() {
            window.location.href = 'insertForm.me';
        });
    }
}

// 네이버 로그인 설정
function naverLogin() {
    const naverClientId = config.naverClientId;
    const naverRedirectURI = encodeURIComponent(config.naverRedirectURI);
    const naverState = Math.random().toString(36).substring(2);
    const naverApiURL = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&'
        + 'client_id=' + naverClientId + "&redirect_uri=" + naverRedirectURI + '&state=' + naverState;
    const naverLoginBtn = document.getElementById('naverLoginLink');
    if (naverLoginBtn) {
        naverLoginBtn.href = naverApiURL;
    } else {
        console.log("네이버 로그인 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }
}

// 카카오 로그인 설정
function kakaoLogin() {
    const kakaoClientId = config.kakaoClientId;
    const kakaoRedirectURI = encodeURIComponent(config.kakaoRedirectURI);
    const kakaoState = Math.random().toString(36).substring(2);
    const kakaoApiURL = 'https://kauth.kakao.com/oauth/authorize?response_type=code&'
        + 'client_id=' + kakaoClientId + "&redirect_uri=" + kakaoRedirectURI + '&state=' + kakaoState;
    const kakaoLoginBtn = document.getElementById('kakaoLoginLink');
    if (kakaoLoginBtn) {
        kakaoLoginBtn.href = kakaoApiURL;
    } else {
        console.log("카카오 로그인 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }
}

// 구글 로그인 설정
function googleLogin() {
    const googleClientId = config.googleClientId;
    const googleRedirectURI = encodeURIComponent(config.googleRedirectURI);
    const googleState = Math.random().toString(36).substring(2);
    const googleApiURL = 'https://accounts.google.com/o/oauth2/auth?response_type=code&'
        + 'client_id=' + googleClientId + "&redirect_uri=" + googleRedirectURI + '&state=' + googleState
        + '&scope=email%20profile';
    const googleLoginBtn = document.getElementById('googleLoginLink');
    if (googleLoginBtn) {
        googleLoginBtn.href = googleApiURL;
    } else {
        console.log("구글 로그인 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }
}
