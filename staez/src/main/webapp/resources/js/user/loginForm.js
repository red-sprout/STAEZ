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
});
