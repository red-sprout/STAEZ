document.addEventListener('DOMContentLoaded', function() {
    // 아이디 찾기 버튼
    var findIdButton = document.getElementById('findIdButton');
    if (findIdButton) {
        findIdButton.addEventListener('click', function() {
            window.location.href = 'findIdForm.me';
        });
    }

    // 비밀번호 찾기 버튼
    var findPwdButton = document.getElementById('findPwdButton');
    if (findPwdButton) {
        findPwdButton.addEventListener('click', function() {
            window.location.href = 'findPwdForm.me';
        });
    }

    // 회원가입 버튼
    var signinButton = document.getElementById('signinButton');
    if (signinButton) {
        signinButton.addEventListener('click', function() {
            window.location.href = 'insertForm.me';
        });
    }

    // 네이버 로그인 설정
    const naverClientId = "qmp5nqG9EBf9YYN33GKV";
    const naverRedirectURI = encodeURIComponent("http://localhost:8888/staez/naver-login");
    const naverState = Math.random().toString(36).substring(2);
    const naverApiURL = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&'
        + 'client_id=' + naverClientId + "&redirect_uri=" + naverRedirectURI + '&state=' + naverState;
    const naverLoginBtn = document.getElementById('naverLoginLink');
    if (naverLoginBtn) {
        naverLoginBtn.href = naverApiURL;
    } else {
        console.log("네이버 로그인 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }

    // 카카오 로그인 설정
    const kakaoClientId = "3d0c80afec61216e697bdf6104040191";
    const kakaoRedirectURI = encodeURIComponent("http://localhost:8888/staez/kakao-login");
    const kakaoState = Math.random().toString(36).substring(2);
    const kakaoApiURL = 'https://kauth.kakao.com/oauth/authorize?response_type=code&'
        + 'client_id=' + kakaoClientId + "&redirect_uri=" + kakaoRedirectURI + '&state=' + kakaoState;
    const kakaoLoginBtn = document.getElementById('kakaoLoginLink');
    if (kakaoLoginBtn) {
        kakaoLoginBtn.href = kakaoApiURL;
    } else {
        console.log("카카오 로그인 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }

});
