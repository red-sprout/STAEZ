document.addEventListener('DOMContentLoaded', function() {
    // 이전페이지로 돌아가는
    backPage();
    // 이메일
    sgininemail();
    // 이메일 인증 전송 버튼 이벤트 리스너 등록
    const emailCheckButton = document.getElementById("emailCheckButton");
    if (emailCheckButton) {
        emailCheckButton.addEventListener('click', (ev) => {
            ev.preventDefault(); // 버튼 클릭 시 기본 동작 막기
            const nameInput = $("#user_name_email").val();
            const emailInput = $("#input-value-email").val(); // 이메일 입력값 가져오기
            verifyNameAndEmail(nameInput, emailInput); // 이메일 인증 요청 보내는 함수 호출
            alert("인증번호가 전송되었습니다 잠시만 기다려주세요.");
        });
    }
    // UUID 이메일 체크
    emailSecretCode();
    // 버튼 클릭 시 색상변경
    checkButton();
    // 비밀번호 관련 이벤트 리스너 추가
    newPwd();
    // 핸드폰 번호 전송 처리
    signinPhoneNumber();
    // 이메일 아이디적는칸에 영어와 숫자만 가능하게
    addEmailValidation();
    // 이메일 주소적는칸에 영어만 가능하게
    addEmailValidationTwo();
    
});


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
function signinPhoneNumber() {
    const prefixElement = document.getElementById("phone-prefix");
    const suffix1Element = document.getElementById("phone-suffix1");
    const suffix2Element = document.getElementById("phone-suffix2");
    const inputValueElement = document.getElementById("input-value-phone");
    const PverificationMessage = document.getElementById("Pverification-message");
    const verificationPhoneTr = document.getElementById("verificationPhoneTr");

    function updatePhoneNumber() {
        const prefix = prefixElement.innerText;
        const suffix1 = suffix1Element.value;
        const suffix2 = suffix2Element.value;
        const phoneNumber = prefix + suffix1 + suffix2;
        inputValueElement.value = phoneNumber;
    }

    function allowOnlyNumbers(event) {
        const value = event.target.value;
        const newValue = value.replace(/[^0-9]/g, ''); // 숫자가 아닌 문자를 제거
        if (newValue !== value) {
            event.target.value = newValue;
            verificationPhoneTr.style.display = "table-row";
            PverificationMessage.style.color = "red";
            PverificationMessage.innerText = "숫자만 입력 가능합니다.";
        } else {
            PverificationMessage.innerText = ""; // 숫자만 입력된 경우 메시지 제거
        }
    }

    suffix1Element.addEventListener('input', updatePhoneNumber);
    suffix1Element.addEventListener('input', allowOnlyNumbers); // 숫자만 입력 가능하도록 추가
    suffix2Element.addEventListener('input', updatePhoneNumber);
    suffix2Element.addEventListener('input', allowOnlyNumbers); // 숫자만 입력 가능하도록 추가
}

// 이전페이지로 돌아가는
function backPage() {
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
        window.history.back();
    });
}

// 이메일 아이디적는칸에 영어와 숫자만 가능하게
function addEmailValidation() {
    const emailPrefixElement = document.getElementById("email-prefix");
    const verificationEmailTr = document.getElementById("verificationEmailTr");
    const verificationMessage = document.getElementById("verification-message");

    emailPrefixElement.addEventListener('input', function(event) {
        const value = event.target.value;
        const validValue = value.replace(/[^a-zA-Z0-9]/g, ''); // 영어와 숫자가 아닌 문자를 제거
        if (value !== validValue) {
            event.target.value = validValue;
            verificationEmailTr.style.display = "table-row";
            verificationMessage.style.color = "red";
            verificationMessage.innerText = "영어 / 숫자 만 가능합니다.";
        } else {
            verificationMessage.innerText = ""; // 올바른 입력일 경우 메시지 제거
        }
    });
}

// 이메일 주소적는칸에 영어만 가능하게
function addEmailValidationTwo() {
    const emailPrefixElement = document.getElementById("email-suffix");
    const verificationEmailTr = document.getElementById("verificationEmailTr");
    const verificationMessage = document.getElementById("verification-message");

    emailPrefixElement.addEventListener('input', function(event) {
        const value = event.target.value;
        const validValue = value.replace(/[^a-zA-Z]/g, ''); // 영어가 아닌 문자를 제거
        if (value !== validValue) {
            event.target.value = validValue;
            verificationEmailTr.style.display = "table-row";
            verificationMessage.style.color = "red";
            verificationMessage.innerText = "한글 / 숫자는 입력이 불가능합니다.";
        } else {
            verificationMessage.innerText = ""; // 올바른 입력일 경우 메시지 제거
        }
    });
}

// 이메일 인증 코드 전송 함수
function sendVerificationCode() {
    const emailInput = document.getElementById("input-value-email").value;
    const nameInput = document.getElementById("input-value-name").value;

    if (nameInput.trim().length > 0 && emailInput.trim().length > 0) {
        verifyNameAndEmail(nameInput, emailInput); // 이름과 이메일 검증 함수 호출
    }
}

// 서버로부터의 이메일 인증 응답을 처리
function handleEmailCheckResponse(response) {
    console.log("handleEmailCheckResponse 응답: " + response); // 응답 로그 추가
    const emailCheckResult = document.getElementById("verificationEmailTr");
    emailCheckResult.style.display = "table-row";
    const verificationMessage = document.getElementById("verification-message");

    if (response === "emailCheck No") {
        verificationMessage.style.color = "red";
        verificationMessage.innerText = "인증번호 전송이 실패했습니다 다시 입력해주세요!";
    } else if (response === "emailCheck Yes") {
        verificationMessage.style.color = "green";
        verificationMessage.innerText = "인증번호가 성공적으로 전송되었습니다!";
        startTimer();
    } else if (response === "emailCheck Invalid") {
        verificationMessage.style.color = "red";
        verificationMessage.innerText = "해당 정보가 없습니다 다시 입력해주세요!";
    } else if (response === "emailCheck Duplicated") {
        verificationMessage.style.color = "red";
        verificationMessage.innerText = "이미 인증번호가 전송되었습니다. 재전송을 눌러주세요.";
    }
}

// UUID 이메일 체크 콜백
function callbackEmailSecret(result, emailSecretCheckResult, check_emailSecretBtn) {
    const userEmailErrorMessage = document.getElementById("userEmailErrorMessage");
    const findEmailCheck = document.getElementById("findEmailCheck");
    emailSecretCheckResult.style.display = "table-row";

    if (result === "emailSecretCodeCheck No") {
        userEmailErrorMessage.style.color = "red";
        userEmailErrorMessage.innerText = "인증 코드가 일치하지 않습니다.";
    } else if (result === "emailSecretCodeCheck Yes") {
        userEmailErrorMessage.style.color = "green";
        userEmailErrorMessage.innerText = "인증이 확인되었습니다.";
        clearInterval(timer); // 타이머 정지
    } else {
        userEmailErrorMessage.style.color = "red";
        userEmailErrorMessage.innerText = "인증을 확인할 수 없습니다.";
    }
}

// UUID 이메일 체크
function emailSecretCode() {
    const checkButton = document.getElementById("check_emailSecretBtn");
    const checkEmail = document.getElementById("input-value-email");
    const verificationCodeInput = document.getElementById("verification-code");
    const emailSecretCheckResult = document.getElementById("checkResultEmailTr");
    const emailSecretErrorMessage = document.getElementById("userEmailErrorMessage");

    checkButton.addEventListener("click", function() {
        const verificationCodeValue = verificationCodeInput.value.trim();

        if (verificationCodeValue.length === 6) {
            const emailValue = checkEmail.value;
            emailCheckCode({ "authNo": verificationCodeValue, "email": emailValue }, function(result) {
                callbackEmailSecret(result, emailSecretCheckResult, verificationCodeInput, emailSecretErrorMessage);
            });
        } else {
            emailSecretCheckResult.style.display = "table-row";
            emailSecretErrorMessage.style.color = "red";
            emailSecretErrorMessage.innerText = "인증코드는 6자리여야 합니다.";
        }
    });
}
let timer; // 전역 변수로 타이머 변수를 선언합니다.

// 카운트 다운 시작 함수
function startTimer() {
    clearInterval(timer); // 이전에 실행 중이던 타이머를 초기화합니다.

    var duration = 3 * 60;
    var timerDisplay = document.getElementById('timer');

    // 카운트 다운 시작
    timer = setInterval(function () {
        var minutes = parseInt(duration / 60, 10);
        var seconds = parseInt(duration % 60, 10);

        // 남은 시간을 표시
        timerDisplay.textContent = minutes + ":" + (seconds < 10 ? "0" + seconds : seconds);

        // 시간을 1초씩 감소
        duration--;

        // 카운트 다운이 끝나면 clearInterval을 호출하여 타이머를 멈춤
        if (duration < 0) {
            clearInterval(timer);
            timerDisplay.textContent = "시간 초과";
        }
    }, 1000);
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
// 비밀번호 관련 이벤트 리스너 추가
function newPwd(){
    const newPasswordInput = document.getElementById("newPassword");
    const confirmNewPasswordInput = document.getElementById("confirmNewPassword");

    if (newPasswordInput && confirmNewPasswordInput) {
        newPasswordInput.addEventListener('input', validatePassword);
        confirmNewPasswordInput.addEventListener('input', validatePassword);
    }

    const pwdImgElement = document.getElementById("pwdImg");
    if (pwdImgElement) {
        pwdImgElement.addEventListener("mousedown", function() {
            togglePasswordVisibility(newPasswordInput, true);
        });
        pwdImgElement.addEventListener("mouseup", function() {
            togglePasswordVisibility(newPasswordInput, false);
        });
    }
}

// 비번 바꾸기 전 아이디 핸드폰 이메일 확인 맞는지
function clickIdPhoneEmail() {
    let id = document.getElementById("input-value-id").value;
    let phone = document.getElementById("input-value-phone").value;
    let email = document.getElementById("input-value-email").value;

    clickIdPhoneEmailSelect({ userId: id, phone: phone, email: email}, function(res) {
        if (res.trim() === "New Pwd Go") {
            // 모달을 보이게 함
            $('#myModal').modal('show');
        } else {
            // 모달을 숨김
            $('#myModal').modal('hide');
            alert("사용자 정보를 찾을 수 없습니다.");
        }
    });
}

// 전역 범위에 timeout 변수를 선언합니다.
var timeout;

// 비밀번호 / 비밀번호 확인이 서로 틀릴 경우를 처리하는 함수
function validatePassword() {
    clearTimeout(timeout); // 이전에 예약된 작업이 있다면 취소합니다.

    timeout = setTimeout(function() {
        var newPassword = document.getElementById("newPassword").value;
        var confirmNewPassword = document.getElementById("confirmNewPassword").value;

        // 비밀번호가 서로 다른 경우
        if (newPassword !== confirmNewPassword) {
            document.getElementById("passwordMessage").innerHTML = "비밀번호가 다릅니다.";
            document.getElementById("passwordMessage").classList.remove("passwordCorrect");
            document.getElementById("passwordMessage").classList.add("passwordIncorrect");
        } else {
            // 비밀번호가 일치하는 경우
            // 비밀번호 유효성 검사: 영문, 숫자, 특수문자 포함, 8글자 이상
            var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
            if (!regex.test(newPassword)) {
                document.getElementById("passwordMessage").innerHTML = "영문, 숫자, 특수문자를 넣어주세요";
                document.getElementById("passwordMessage").classList.remove("passwordCorrect");
                document.getElementById("passwordMessage").classList.add("passwordIncorrect");
            } else {
                document.getElementById("passwordMessage").innerHTML = "비밀번호가 일치합니다.";
                document.getElementById("passwordMessage").classList.remove("passwordIncorrect");
                document.getElementById("passwordMessage").classList.add("passwordCorrect");
            }
        }
    });
}

// 비밀번호 클릭시 보이도록 (마우스가 눌린 상태에서만)
function togglePasswordVisibility(inputField, isMouseDown) {
    if (isMouseDown && inputField.type === "password") {
        inputField.type = "text";
    } else {
        inputField.type = "password";
    }
}

// 비밀번호 변경
function clickNewPwd() {
    let newPassword = document.getElementById("newPassword").value;
    let confirmNewPassword = document.getElementById("confirmNewPassword").value;

    if (newPassword !== confirmNewPassword) {
        alert("새 비밀번호가 일치하지 않습니다.");
        return;
    }

    // 비밀번호 유효성 검사
    var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
    if (!regex.test(newPassword)) {
        alert("비밀번호는 영문, 숫자, 특수문자를 포함한 8글자 이상이어야 합니다.");
        return;
    }

    let id = document.getElementById("input-value-id").value;
    let phone = document.getElementById("input-value-phone").value;
    let email = document.getElementById("input-value-email").value;
    let userName = document.getElementById("user_name").value;

    clickNewPwdInsert({ userId: id, phone: phone, email: email,userName:userName, newPassword: newPassword }, function(res) {

        if (res.trim() === "Password Changed") {
            alert("비밀번호가 성공적으로 변경되었습니다.");
            window.location.href = "/staez/loginForm.me"; // 변경 성공 시 로그인 페이지로 이동
        } else {
            alert("비밀번호 변경에 실패했습니다.");
        }
    });
}

// 버튼 클릭 시 색상 변경
function checkButton() {
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
