document.addEventListener('DOMContentLoaded', function() {
    //이전페이지로 돌아가는
    backPage();
    // 이메일
    sgininemail();
    // 이메일 아이디적을때 한글안되고 영어만 가능하게
    sgininemailEng();
    // 입력 시 2초 후에 콘솔에 이메일 값을 출력하는 기능입니다.
    emailTimeTwo();
    // 이메일 인증 전송 버튼 이벤트 리스너 등록
    $("#emailCheckButton").on('click', (ev) => {
        // 클릭 이벤트 발생 시 서버로 이메일 인증 요청 보내기
        const emailInput = $("#input-value-email").val(); // 이메일 입력값 가져오기
        sendEmailVerificationRequest(emailInput); // 이메일 인증 요청 보내는 함수 호출
    });
    // UUID 이메일 체크
    emailSecretCode();
    // 핸드폰 번호 전송 처리
    signinPhoneNumber();
    // 버튼 클릭시 색상변경
    checkButton();
});
//이전페이지
function backPage(){
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
        window.history.back();
    });
}

// 이메일 인증 코드 전송 함수
function sendVerificationCode() {
    const emailInput = document.getElementById("input-value-email").value;

    if (emailInput.trim().length > 0) {
        sendEmailVerificationRequest(emailInput); // AJAX 호출 함수 호출
    }
}

// 서버로부터의 이메일 인증 응답을 처리
function handleEmailCheckResponse(response) {
    const emailCheckResult = document.getElementById("checkResultEamil");
    emailCheckResult.style.display = "block";
    if (response === "emailCheck No") {
        alert("인증번호 전송이 실패했습니다 다시 입력해주세요!");
    } else if (response === "emailCheck Yes") {
        alert("인증번호가 성공적으로 전송되었습니다!");
    }
}

// UUID 이메일 체크 콜백
function callbackEmailSecret(result, emailSecretCheckResult, emailSecretInput, emailSecretErrorMessage) {
    console.log("Callback result:", result);
    emailSecretCheckResult.style.display = "block";

    if (result === "emailSecretCodeCheck No") { // 입력값이 데이터베이스 값과 일치하지 않을 때
        emailSecretCheckResult.style.color = "red";
        emailSecretCheckResult.innerText = "인증 코드가 일치하지 않습니다.";
        // 다음 버튼 비활성화
        document.getElementById("findEmailCheck").disabled = true;
        findEmailCheckButton.style.backgroundColor = "white";
    } else if (result === "emailSecretCodeCheck Yes") { // 입력값이 데이터베이스 값과 일치할 때
        emailSecretCheckResult.style.color = "green";
        emailSecretCheckResult.innerText = "인증이 확인되었습니다.";
        console.log("이메일 확인:", emailSecretInput.value);
        // 다음 버튼 활성화
        document.getElementById("findEmailCheck").disabled = false;
    } else { // 그 외의 경우 (예: 서버 오류 등)
        emailSecretCheckResult.style.color = "red";
        emailSecretCheckResult.innerText = "인증을 확인할 수 없습니다.";
        // 다음 버튼 비활성화
        document.getElementById("findEmailCheck").disabled = true;
        findEmailCheckButton.style.backgroundColor = "white";
    }
    emailSecretErrorMessage.style.display = "none"; // 에러 메시지 숨기기
}

// UUID 이메일 체크
function emailSecretCode() {
    const checkButton = document.getElementById("check_emailSecretBtn");
    const checkEmail = document.getElementById("input-value-email");
    const verificationCodeInput = document.getElementById("verification-code");
    const emailSecretCheckResult = document.getElementById("checkResultEamil");
    const emailSecretErrorMessage = document.getElementById("userEmailErrorMessage");

    checkButton.addEventListener("click", function() {
        const verificationCodeValue = verificationCodeInput.value.trim();
        
        if (verificationCodeValue.length >= 6 && verificationCodeValue.length <= 6) {
            // 입력된 이메일과 입력된 값을 서버로 보냄
            const emailValue = checkEmail.value;
            // console.log("Email: " + emailValue);
            // console.log("Verification Code: " + verificationCodeValue);
            emailCheckCode({ "authNo": verificationCodeValue, "email": emailValue }, function(result) {
                callbackEmailSecret(result, emailSecretCheckResult, verificationCodeInput, emailSecretErrorMessage);
            });
        } else {
            console.log("인증코드는 6자리 이상이어야 합니다.");
            emailSecretCheckResult.innerText = "인증코드는 6자리 이상이어야 합니다.";
            emailSecretCheckResult.style.color = "red";
            emailSecretCheckResult.style.display = "block"; // 에러 메시지 표시
            emailSecretErrorMessage.style.display = "none";
        }
    });
}
// 이메일
function sgininemail() {
    // 필요한 요소들을 가져옵니다.
    const prefixElement = document.getElementById("email-prefix");
    const suffixElement = document.getElementById("email-suffix");
    const domainList = document.getElementById("email-domain-list");
    const inputValueElement = document.getElementById("input-value-email");

    // 이메일 주소를 업데이트하는 함수를 정의합니다.
    function updateEmail() {
        const prefix = prefixElement.value;
        const suffix = suffixElement.value;
        const domain = domainList.value;

        if (domain !== "type") {
            inputValueElement.value = prefix + "@" + domain;
        } else if (prefix && suffix) {
            inputValueElement.value = prefix + "@" + suffix;
        } else {
            inputValueElement.value = "";
        }
        //console.log(prefix + "@" + domain);
    }
    // 도메인 리스트 변경 시 처리하는 함수를 정의합니다.
    function handleDomainListChange() {
        const selectedOption = domainList.options[domainList.selectedIndex].value;

        if (selectedOption !== "type") {
            suffixElement.value = selectedOption;
            suffixElement.placeholder = "";
            suffixElement.disabled = true;
        } else {
            suffixElement.value = "";
            suffixElement.placeholder = "직접 입력";
            suffixElement.disabled = false;
        }
        updateEmail(); // 이메일 업데이트 함수를 호출하여 이메일 값을 업데이트합니다.
    }
    // 초기화 함수를 정의합니다.
    function init() {
        handleDomainListChange(); // 도메인 리스트 변경 처리 함수를 호출합니다.
        prefixElement.addEventListener('input', updateEmail); // 프리픽스 입력 시 이메일 업데이트 함수를 호출합니다.
        suffixElement.addEventListener('input', updateEmail); // 서픽스 입력 시 이메일 업데이트 함수를 호출합니다.
        domainList.addEventListener('change', handleDomainListChange); // 도메인 리스트 변경 시 처리하는 함수를 호출합니다.
    }
    init(); // 페이지 로드 시 초기화 함수를 호출합니다.
}

function emailTimeTwo() {
    const emailInput = document.getElementById("email-prefix");
    const suffixInput = document.getElementById("email-suffix");

    emailInput.addEventListener('input', function() {
        const emailPrefix = emailInput.value;
        const emailSuffix = suffixInput.value;
        //console.log(emailPrefix + "@" + emailSuffix);
    });

    suffixInput.addEventListener('input', function() {
        const emailPrefix = emailInput.value;
        const emailSuffix = suffixInput.value;
        //console.log(emailPrefix + "@" + emailSuffix);
    });
}

// 이메일 아이디 적을 때 한글 안 되고 영어만 가능하게
function sgininemailEng() {
    const prefixElement = document.getElementById("email-prefix");
    const userEmailErrorMessage = document.getElementById("userEmailErrorMessage");

    prefixElement.addEventListener('input', function() {
        const value = prefixElement.value;
        const regex = /^[a-zA-Z0-9]*$/; // 영문자와 숫자만 허용하는 정규식

        if (!regex.test(value)) {
            prefixElement.value = value.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');

            if (userEmailErrorMessage) {
                userEmailErrorMessage.innerText = "영어 입력만 가능합니다.";
                userEmailErrorMessage.style.color = "red";
            }
        } else {
            if (userEmailErrorMessage) {
                userEmailErrorMessage.innerText = "";
            }
        }
    });
}

// 비번 바꾸기 전 아이디 핸드폰 이메일 확인 맞는지
function clickIdPhoneEmail() {
    let id = document.getElementById("input-value-id").value;
    let phone = document.getElementById("input-value-phone").value;
    let email = document.getElementById("input-value-email").value;

    // 데이터 확인
    console.log("ID:", id);
    console.log("Phone:", phone);
    console.log("Email:", email);

    clickIdPhoneEmailSelect({ userId: id, phone: phone, email: email }, function(res) {
        console.log(res);
        if (res.trim() === "New Pwd Go") {
            // 모달 대신에 스타일을 변경하여 모달을 보이게 함
            document.getElementById("myModal").style.display = "block";
        } else {
            alert("사용자 정보를 찾을 수 없습니다.");
        }
    });
}

// 비밀번호 변경
function clickNewPwd() {
    let newPassword = document.getElementById("newPassword").value;
    let confirmNewPassword = document.getElementById("confirmNewPassword").value;

    if (newPassword !== confirmNewPassword) {
        alert("새 비밀번호가 일치하지 않습니다.");
        return;
    }

    let id = document.getElementById("input-value-id").value;
    let phone = document.getElementById("input-value-phone").value;
    let email = document.getElementById("input-value-email").value;

    // 데이터 확인
    console.log("New Password:", newPassword);

    clickNewPwdInsert({ userId: id, phone: phone, email: email, newPassword: newPassword }, function(res) {
        console.log(res);
        if (res.trim() === "Password Changed") {
            alert("비밀번호가 성공적으로 변경되었습니다.");
            window.location.href = "/staez/loginForm.me"; // 변경 성공 시 로그인 페이지로 이동
        } else {
            alert("비밀번호 변경에 실패했습니다.");
        }
    });
}

// 핸드폰 번호 전송 처리
function signinPhoneNumber (){
    const prefixElement = document.getElementById("phone-prefix");
    const suffix1Element = document.getElementById("phone-suffix1");
    const suffix2Element = document.getElementById("phone-suffix2");
    const inputValueElement = document.getElementById("input-value-phone");

    function updatePhoneNumber() {
        const prefix = prefixElement.innerText;
        const suffix1 = suffix1Element.value;
        const suffix2 = suffix2Element.value;
        const phoneNumber = prefix + suffix1 + suffix2;
        inputValueElement.value = phoneNumber;
    }
    suffix1Element.addEventListener('input', updatePhoneNumber);
    suffix2Element.addEventListener('input', updatePhoneNumber);
}
// 핸드폰 번호 전송 처리
function sendPhoneNumber() {
    // input-value-phone 요소를 가져옵니다.
    var inputValueElement = document.getElementById("input-value-phone");
    if (!inputValueElement) {
        console.error("input-value-phone 요소를 찾을 수 없습니다.");
        return;
    }
    // phone-prefix 요소가 존재하는지 확인
    var prefixElement = document.getElementById("phone-prefix");
    if (!prefixElement) {
        console.error("phone-prefix 요소를 찾을 수 없습니다.");
        return;
    }
    // 010 부분 가져오기
    var prefix = prefixElement.innerText;

    // 각 번호 입력란의 값 가져오기
    var suffix1 = document.getElementById("phone-suffix1").value;
    var suffix2 = document.getElementById("phone-suffix2").value;

    // 전체 번호 조합하여 표시
    var phoneNumber = prefix + suffix1 + suffix2;
    //console.log(phoneNumber); // 번호 확인용, 실제 사용시 주석처리해도 됩니다.

    // input-value-phone 필드에 번호 설정
    inputValueElement.value = phoneNumber;
}

// 버튼 클릭시 색상변경
function checkButton(){
    var buttons = document.querySelectorAll(".check_button");

    // 각 버튼에 대해 반복
    buttons.forEach(function(button) {
        // 클릭 이벤트 리스너 추가
        button.addEventListener("mousedown", function() {
        // 버튼에 clicked 클래스 추가
        button.classList.add("clicked");
        });
        
        // 마우스 버튼에서 떼었을 때
        button.addEventListener("mouseup", function() {
        // 버튼에 clicked 클래스 제거
        button.classList.remove("clicked");
        });
    });
}