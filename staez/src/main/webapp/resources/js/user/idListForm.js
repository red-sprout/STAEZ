document.addEventListener('DOMContentLoaded', function() {
    var checkboxes = document.querySelectorAll('.idListCheckbox');

    // 각 체크박스에 change 이벤트 리스너 추가
    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            // 다른 체크박스를 해제
            if (this.checked) {
                checkboxes.forEach(function(otherCheckbox) {
                    if (otherCheckbox !== checkbox) {
                        otherCheckbox.checked = false;
                    }
                });
            }
        });
    });

// 로그인 버튼 클릭 이벤트
var loginButton = document.getElementById('loginButton');
loginButton.addEventListener('click', function() {
    window.location.href = '/staez/loginForm.me'; // 프로젝트명은 실제 프로젝트명으로 변경해야 합니다.
});

// 비밀번호 찾기 버튼 클릭 이벤트
var pwdButton = document.getElementById('pwdButton');
pwdButton.addEventListener('click', function() {
    window.location.href = '/staez/findPwdForm.me'; // 프로젝트명은 실제 프로젝트명으로 변경해야 합니다.
});

});
