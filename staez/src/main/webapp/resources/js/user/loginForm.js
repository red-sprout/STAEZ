document.addEventListener('DOMContentLoaded', function() {
    // 아이디 찾기 버튼
    var findIdButton = document.getElementById('findIdButton');
    if (findIdButton) {
        console.log("아이디 찾기 버튼이 발견되었습니다."); // 디버깅용 콘솔 로그
        findIdButton.addEventListener('click', function() {
            console.log("아이디 찾기 버튼 클릭됨."); // 디버깅용 콘솔 로그
            window.location.href = 'findIdForm.me';
        });
    } else {
        console.log("아이디 찾기 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }

    // 비밀번호 찾기 버튼
    var findPwdButton = document.getElementById('findPwdButton');
    if (findPwdButton) {
        console.log("비밀번호 찾기 버튼이 발견되었습니다."); // 디버깅용 콘솔 로그
        findPwdButton.addEventListener('click', function() {
            console.log("비밀번호 찾기 버튼 클릭됨."); // 디버깅용 콘솔 로그
            window.location.href = 'findPwdForm.me';
        });
    } else {
        console.log("비밀번호 찾기 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }

    // 회원가입 버튼
    var signinButton = document.getElementById('signinButton');
    if (signinButton) {
        console.log("회원가입 버튼이 발견되었습니다."); // 디버깅용 콘솔 로그
        signinButton.addEventListener('click', function() {
            console.log("회원가입 버튼 클릭됨."); // 디버깅용 콘솔 로그
            window.location.href = 'insertForm.me';
        });
    } else {
        console.log("회원가입 버튼을 찾을 수 없습니다."); // 디버깅용 콘솔 로그
    }

    // 네이버로그인설정
    window.onload = function() {
        const clientId= "qmp5nqG9EBf9YYN33GKV";
        // 리다이렉트 URI를 UTF-8로 인코딩(encodeURIComponent)해서 저장
        const redirectURI = encodeURIComponent("http://localhost:8888/staez/naver-login")

        const state = Math.random().toString(36).substring(2);

        //로그인 api url
        const apiURL = 'https://nid.naver.com/oauth2.0/authorize?response_type=code&'
            + 'client_id=' + clientId + "&redirect_uri=" +  redirectURI + '&state=' + state;

        const loginBtn = document.getElementById('naverLoginLink');
        loginBtn.href = apiURL;
    }
});

