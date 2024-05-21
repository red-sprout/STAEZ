// 아이디찾기 버튼 눌렀을때
document.addEventListener('DOMContentLoaded', function() {
    var loginButton = document.getElementById('findIdButton');
    loginButton.addEventListener('click', function() {
        window.location.href = '${contextPath}/findIdForm.me';
    });
});

// 비밀번호찾기 버튼 눌렀을때
document.addEventListener('DOMContentLoaded', function() {
    var loginButton = document.getElementById('findPwdButton');
    loginButton.addEventListener('click', function() {
        window.location.href = '${contextPath}/findPwdForm.me';
    });
});

// 회원가입 버튼 눌렀을때
document.addEventListener('DOMContentLoaded', function() {
    var loginButton = document.getElementById('signinButton');
    loginButton.addEventListener('click', function() {
        window.location.href = '${contextPath}/insertForm.me';
    });
});