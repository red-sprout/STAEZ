document.addEventListener('DOMContentLoaded', function() {
    // 페이지 로드 시 findId-div를 숨김
    var findPhoneDiv = document.getElementById('findphone-div');
    var findEmailDiv = document.getElementById('findemail-div');
    findPhoneDiv.style.display = 'none';
    findEmailDiv.style.display = 'none';

    // phone-auth 체크박스에 클릭 이벤트를 추가하여 내용을 보이도록 함
    var phoneAuthCheckbox = document.getElementById('phone-auth');
    var emailAuthCheckbox = document.getElementById('email-auth');
    
    phoneAuthCheckbox.addEventListener('change', function() {
        if (this.checked) {
            // 체크박스가 체크되면 findId-div를 보이도록 함
            findPhoneDiv.style.display = 'block';
            findEmailDiv.style.display = 'none';
            emailAuthCheckbox.checked = false;
        } else {
            // 체크박스가 해제되면 findId-div를 숨김
            findPhoneDiv.style.display = 'none';
        }
    });

    emailAuthCheckbox.addEventListener('change', function() {
        if (this.checked) {
            // 체크박스가 체크되면 findId-div를 보이도록 함
            findEmailDiv.style.display = 'block';
            findPhoneDiv.style.display = 'none';
            phoneAuthCheckbox.checked = false;
        } else {
            // 체크박스가 해제되면 findId-div를 숨김
            findEmailDiv.style.display = 'none';
        }
    });
});

// 이전페이지로 돌아가는
document.addEventListener('DOMContentLoaded', function() {
var backButton = document.getElementById('backButton');
backButton.addEventListener('click', function() {
    window.history.back();
});
});

// 아이디찾은 페이지로 가기위해
document.addEventListener('DOMContentLoaded', function() {
var submitButton = document.querySelector('button[type="submit"]');
submitButton.addEventListener('click', function() {
    // 폼 데이터 수집
    var formData = {
        name: document.querySelector('input[name="name"]').value,
        phonePrefix: document.querySelector('select[name="phone-prefix"]').value,
        phoneMid: document.querySelector('input[name="phone-mid"]').value,
        phoneEnd: document.querySelector('input[name="phone-end"]').value,
        verification: document.querySelector('input[name="verification"]').value
    };

    // 쿼리 문자열 생성
    var queryString = Object.keys(formData).map(function(key) {
        return encodeURIComponent(key) + '=' + encodeURIComponent(formData[key]);
    }).join('&');

    // 다음 페이지 URL에 쿼리 문자열 추가하여 이동
    window.location.href = '${contextPath}/register.php?' + queryString;
});
});