document.addEventListener('DOMContentLoaded', function() {
    //인증모달
    toggleAuthMethod();
    //이전페이지로 돌아가는
    backPage();
    //찾은 아이디 페이지
    idListPage();
    // 이메일
    sgininemail();
    // 이메일 아이디적을때 한글안되고 영어만 가능하게
    sgininemailEng();
    // 입력 시 2초 후에 콘솔에 이메일 값을 출력하는 기능입니다.
    emailTimeTwo()
});

//인증 모달창
function toggleAuthMethod(){
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
}

//이전페이지
function backPage(){
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
    window.history.back();
});
}

//찾은 아이디 페이지
function idListPage(){
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
}

// 이메일
function sgininemail() {
    // 이메일 입력란의 값을 가져옵니다.
    const emailPrefix = document.getElementById("email-prefix").value;
    const emailSuffix = document.getElementById("email-suffix").value;

    // 이메일 값을 조합하여 이메일 주소를 만듭니다.
    const emailAddress = emailPrefix + "@" + emailSuffix;

    // 입력값을 출력하는 요소에 이메일 주소를 설정합니다.
    document.getElementById("input-value-email").value = emailAddress;

    // 콘솔에 이메일 주소를 출력합니다.
    console.log("이메일 주소:", emailAddress);
}



// 입력 시 2초 후에 콘솔에 이메일 값을 출력하는 기능입니다.
let typingTimer;

function emailTimeTwo() {
    const emailInput = document.getElementById("email-prefix");
    const suffixInput = document.getElementById("email-suffix");

    emailInput.addEventListener('input', function() {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(function() {
            const emailPrefix = emailInput.value;
            const emailSuffix = suffixInput.value;
            console.log("입력된 이메일 아이디 값:", emailPrefix + "@");
        }, 2000);
    });

    // 이메일 입력 상자에 대한 이벤트 리스너
    suffixInput.addEventListener('input', function() {
        // 이전에 설정된 타이머를 지웁니다.
        clearTimeout(typingTimer);
        // 500ms 후에 실행되는 타이머 설정
        typingTimer = setTimeout(function() {
            // 이메일 프리픽스와 서픽스 값을 가져와서 이메일 주소로 결합합니다.
            const emailPrefix = emailInput.value;
            const emailSuffix = suffixInput.value;
            console.log("입력된 이메일 주소 값:", emailPrefix + "@" + emailSuffix);
        });
    });
}

// 이메일 아이디적을때 한글안되고 영어만 가능하게
function sgininemailEng(){
    const prefixElement = document.getElementById("email-prefix");
    const userEmailErrorMessage = document.getElementById("userEmailErrorMessage");

    prefixElement.addEventListener('input', function() {
        const value = prefixElement.value;
        const regex = /^[a-zA-Z0-9]*$/; // 영문자와 숫자만 허용하는 정규식

        if (!regex.test(value)) {
            // 입력된 값이 한글인 경우 빈 문자열로 대체하여 입력값을 영문만 포함하도록 합니다.
            prefixElement.value = value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');

            // userEmailErrorMessage에 영어 입력만 가능합니다 메시지 추가
            if (userEmailErrorMessage) {
                userEmailErrorMessage.innerText = "영어 입력만 가능합니다.";
                userEmailErrorMessage.style.color = "red";
            }
        } else {
            // 한글 입력이 아닐 때 에러 메시지를 초기화합니다.
            if (userEmailErrorMessage) {
                userEmailErrorMessage.innerText = "";
            }
        }
    });
}

