document.addEventListener('DOMContentLoaded', function() {
    // 인증 모달
    toggleAuthMethod();
    // 이전 페이지로 돌아가는
    backPage();
    // 이메일
    sgininemail();
    // 이메일 인증 전송 버튼 이벤트 리스너 등록
    emailCheckButton();
    // UUID 이메일 체크
    emailSecretCode();
    // 버튼 클릭시 색상변경
    checkButton();
    // 모달) 로그인 버튼 클릭 이벤트
    LoginPage();
    // 모달) 비밀번호 찾기 클릭 이벤트
    PwdFindPage();
    // 핸드폰 번호 전송 처리
    signinPhoneNumber();
    // 이메일 아이디적는칸에 영어와 숫자만 가능하게
    addEmailValidation();
    // 이메일 주소적는칸에 영어만 가능하게
    addEmailValidationTwo();
    // 이메일 인증 체크박스 이벤트 리스너 추가
    findDivEmail();
});

// 인증 모달창
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

// 이전페이지
function backPage(){
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
        window.history.back();
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

let authNo;

// 폰 인증
function phoneClick() {
    const phoneInputValue = document.getElementById("input-value-phone").value;
    const userName = document.getElementById("user_name_phone").value;
    var verificationPhoneTr = document.getElementById("verificationPhoneTr");
    var PverificationMessage = document.getElementById("Pverification-message");
    const stopBtn = document.getElementById("check_PhoneSecretBtn");

    authNo = Math.floor(Math.random() * 1000000).toString().padStart(6, '0');
    //$('#phoneCheck').prop('checked', false);
    document.getElementById('phoneCheck').checked = false;
    verificationPhoneTr.style.display = "table-row";

    // 먼저 이름과 전화번호를 검증
    verifyPhoneAndName(userName, phoneInputValue, function(res) {
        if (res === "findPhoneCheck No") {
            PverificationMessage.style.color = "red";
            PverificationMessage.innerHTML = "해당 이름과 일치하는 핸드폰 번호가 없습니다 다시 입력하세요.";
        } else {
            sendPhoneAuthNoAjax({ authNo, PhoneInput: phoneInputValue }, function(res) {
                if (res === "NNNNY") {
                    verificationPhoneTr.style.display = "table-row";
                    PverificationMessage.style.color = "green";
                    stopBtn.disabled = false;
                    PverificationMessage.innerHTML = "인증번호가 전송되었습니다.";
                    console.log('인증번호 : ' + authNo);
                    console.log('전송한 휴대폰번호 : ' + phoneInputValue);

                    startPTimer(); // 1분 타이머 시작
                } else {
                    verificationPhoneTr.style.display = "table-row";
                    PverificationMessage.style.color = "red";
                    PverificationMessage.innerHTML = "전송에 실패했습니다. 핸드폰 번호를 다시 한번 확인해주세요.";
                }
            });
        }
    });
}

// 폰 인증 확인
function checkAuthNum() {
    const inputCode = document.getElementById("Pverification-code").value;
    var checkResultPhoneTr = document.getElementById("checkResultPhoneTr");
    var userPhoneErrorMessage = document.getElementById("userPhoneErrorMessage");
    const findPhoneCheck = document.getElementById("findPhoneCheck");
    const stopBtn = document.getElementById("check_PhoneSecretBtn");
    if (authNo !== inputCode) {
        checkResultPhoneTr.style.display = "table-row";
        userPhoneErrorMessage.style.color = "red";
        userPhoneErrorMessage.innerHTML = "인증 실패 다시 한번 확인해주세요.";
    } else {
        stopBtn.disabled = true;
        checkResultPhoneTr.style.display = "table-row";
        userPhoneErrorMessage.style.color = "green";
        userPhoneErrorMessage.innerHTML = "인증에 성공하였습니다";
        clearInterval(ptimer); // 타이머 정지
        findPhoneCheck.disabled = false; // "다음" 버튼 활성화
    }
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
        const validValue = value.replace(/[^a-zA-Z.]/g, ''); // 영어가 아닌 문자를 제거
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
    const emailCheckResult = document.getElementById("verificationEmailTr");
    emailCheckResult.style.display = "table-row";
    const verificationMessage = document.getElementById("verification-message");
    const stopEmailBtn = document.getElementById("check_emailSecretBtn");

    if (response === "emailCheck No") {
        verificationMessage.style.color = "red";
        verificationMessage.innerText = "인증번호 전송이 실패했습니다 다시 입력해주세요!";
    } else if (response === "emailCheck Yes") {
        verificationMessage.style.color = "green";
        verificationMessage.innerText = "인증번호가 성공적으로 전송되었습니다!";
        stopEmailBtn.disabled = false;
        startTimer();
    } else if (response === "emailCheck Invalid") {
        verificationMessage.style.color = "red";
        verificationMessage.innerText = "해당 정보가 없습니다 다시 입력해주세요!";
    }
}

// UUID 이메일 체크 콜백
function callbackEmailSecret(result, emailSecretCheckResult, check_emailSecretBtn) {
    const userEmailErrorMessage = document.getElementById("userEmailErrorMessage");
    const findEmailCheck = document.getElementById("findEmailCheck");
    const stopEmailBtn = document.getElementById("check_emailSecretBtn");
    emailSecretCheckResult.style.display = "table-row";

    if (result === "emailSecretCodeCheck No") {
        userEmailErrorMessage.style.color = "red";
        userEmailErrorMessage.innerText = "인증 코드가 일치하지 않습니다.";
    } else if (result === "emailSecretCodeCheck Yes") {
        userEmailErrorMessage.style.color = "green";
        userEmailErrorMessage.innerText = "인증이 확인되었습니다.";
        clearInterval(timer); // 타이머 정지
        findEmailCheck.disabled = false; // "다음" 버튼 활성화
        stopEmailBtn.disabled = true; // 인증확인버튼 비활성화
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

// 이메일 인증 전송 버튼 이벤트 리스너 등록
function emailCheckButton(){
    const emailCheckButton = document.getElementById("emailCheckButton");
    if (emailCheckButton) {
        emailCheckButton.addEventListener('click', (ev) => {
            ev.preventDefault(); // 버튼 클릭 시 기본 동작 막기
            const nameInput = document.getElementById("user_name_email").value;
            const emailInput = document.getElementById("input-value-email").value;
            verifyNameAndEmail(nameInput, emailInput); // 이메일 인증 요청 보내는 함수 호출
            alert("인증번호가 전송되었습니다 잠시만 기다려주세요.");
        });
    }
}

let timer; 
let ptimer; 

// 핸드폰 타이머 시작 함수
function startPTimer() {
    clearInterval(ptimer); // 기존 타이머가 있으면 제거

    let duration = 3 * 60;
    const ptimerDisplay = document.getElementById('Ptimer');

    ptimer = setInterval(function() {
        const minutes = parseInt(duration / 60, 10);
        const seconds = parseInt(duration % 60, 10);

        ptimerDisplay.textContent = minutes + ":" + (seconds < 10 ? "0" + seconds : seconds);
        duration--;

        if (duration < 0) {
            clearInterval(ptimer);
            ptimerDisplay.textContent = "시간 초과";

            // 시간 초과 시 인증 실패 메시지 표시
            var checkResultPhoneTr = document.getElementById("checkResultPhoneTr");
            var userPhoneErrorMessage = document.getElementById("userPhoneErrorMessage");
            checkResultPhoneTr.style.display = "table-row";
            userPhoneErrorMessage.style.color = "red";
            userPhoneErrorMessage.innerHTML = "인증 실패 다시 한번 확인해주세요.";

            //$("#check_PhoneSecretBtn").prop('disabled', true); // 인증확인 버튼 비활성화
            document.getElementById('check_PhoneSecretBtn').disabled = true; // 인증확인 버튼 비활성화
        }
    }, 1000);
}

// "인증번호 전송" 버튼 클릭 이벤트 핸들러 등록
const phoneCheckButton = document.getElementById("phoneCheckButton");
if (phoneCheckButton) {
    phoneCheckButton.addEventListener("click", function() {
        phoneClick();
        //$("#check_PhoneSecretBtn").prop('disabled', false); // 인증확인 버튼 활성화
        document.getElementById('check_PhoneSecretBtn').disabled = false; // 인증확인 버튼 활성화
    });
}

// "인증확인" 버튼 클릭 이벤트 핸들러 등록
const checkPhoneSecretBtn = document.getElementById("check_PhoneSecretBtn");
if (checkPhoneSecretBtn) {
    checkPhoneSecretBtn.addEventListener("click", function() {
        checkAuthNum();
    });
}

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

// 이메일 인증 체크박스 이벤트 리스너 추가
function findDivEmail(){
    const emailAuthCheckbox = document.getElementById('email-auth');
    const findDivEmail = document.getElementById('find-div-email');

    emailAuthCheckbox.addEventListener('change', function() {
        if (this.checked) {
            findDivEmail.style.marginBottom = '40px';
        } else {
            findDivEmail.style.marginBottom = ''; // 기본값으로 복원
        }
    });
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

// 이메일로 아이디 찾기 불러오기
function clickGetId() {
    let email = document.getElementById("input-value-email").value;
    let userName = document.getElementById("user_name_email").value;
    getIdbyEmail({ checkFindEmail: email, userName: userName }, function(res) {
        if (res !== "") {
            document.querySelector("#emailFindId").innerHTML = "아이디 : " + res;
        } else {
            document.querySelector("#emailFindId").innerText = "해당 이메일이 등록된 아이디가 없습니다.";
        }
    });
}

// 핸드폰 아이디 찾기 불러오기
function clickGetIdPhone() {
    let phone = document.getElementById("input-value-phone").value;
    let userName = document.getElementById("user_name_phone").value;
    getIdbyPhone({ checkFindPhone: phone, userName: userName }, function(res) {
        if (res !== "findPhoneCheck No") {
            document.querySelector("#emailFindId").innerHTML = "아이디 : " + res;
        } else {
            document.querySelector("#emailFindId").innerText = "해당 핸드폰 번호로 등록된 아이디가 없습니다.";
        }
    });
}
// 로그인 버튼 클릭 이벤트
function LoginPage(){
    var loginButton = document.getElementById('loginButton');
    if (loginButton) {
        loginButton.addEventListener('click', function() {
            window.location.href = '/staez/loginForm.me';
        });
    }
}

// 비밀번호 찾기 버튼 클릭 이벤트
function PwdFindPage(){
    var pwdButton = document.getElementById('pwdFindButton');
    if (pwdButton) {
        pwdButton.addEventListener('click', function() {
            window.location.href = '/staez/findPwdForm.me';
        });
    }
}