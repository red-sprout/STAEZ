document.addEventListener('DOMContentLoaded', function() {
    // 닉네임 중복 체크
    nicknameCheck();
    // 사용자 아이디 중복 체크
    signinIdCheck();
    // 비밀번호 본인확인 버튼
    signinPwdCheck();
    // SubmitButton 제출
    signinSubmitButton();
    // 이전페이지로 돌아가는
    backPage();
    // 관심장르 3개이상 못고르게하면서 값 출력되도록
    sginingenreLike();
    // 핸드폰 번호 전송 처리
    signinPhoneNumber();
    // 이메일
    sgininemail();
    // 이메일 인증 전송 버튼 이벤트 리스너 등록
    emailCheckButton();
    // UUID 이메일 체크
    emailSecretCode();
    // 버튼 클릭시 색상변경
    checkButton();
    // 생년월일
    DateInput();
    // 이메일 아이디적는칸에 영어와 숫자만 가능하게
    addEmailValidation();
    // 이메일 주소적는칸에 영어만 가능하게
    addEmailValidationTwo();
    // "인증번호 전송" 버튼 클릭 이벤트 핸들러 등록
    phoneCheckButton();
    // "인증확인" 버튼 클릭 이벤트 핸들러 등록
    checkPhoneSecretBtn();
});

// 닉네임 중복체크
function nicknameCheck() {
    const nicknameInput = document.querySelector("#nickname");
    const nicknameCheckButton = document.getElementById("nickNameCheckButton");
    const nicknameCheckResult = document.getElementById("checkResultNickTr");
    const nicknameErrorMessage = document.getElementById("nicknameErrorMessage");

    if (nicknameInput && nicknameCheckButton && nicknameCheckResult && nicknameErrorMessage) {
        nicknameCheckButton.addEventListener('click', function() {
            const str = nicknameInput.value.trim();
            if (str.length >= 1) {
                nickCheck({"checkNick": str}, (result) => callbackNickCheck(result, nicknameCheckResult, nicknameInput, nicknameErrorMessage));
            } else {
                nicknameCheckResult.style.display = "table-row";
                nicknameErrorMessage.style.color = "red";
                nicknameErrorMessage.innerText = "닉네임을 입력해주세요.";
            }
        });
    } else {
        console.log("닉네임 체크 요소 중 하나가 누락되었습니다.");
    }
}

// 닉네임 중복체크 콜백
function callbackNickCheck(result, nicknameCheckResult, nicknameInput, nicknameErrorMessage) {
    nicknameCheckResult.style.display = "table-row";
    if (result === "NNNNN") {
        nicknameErrorMessage.style.color = "red";
        nicknameErrorMessage.innerText = "이미 사용중인 닉네임입니다.";
        nicknameInput.value = "";
    } else if (result === "NNNNY") {
        var regex = /^[a-zA-Z0-9가-힣]{2,16}$/;
        if (!regex.test(nicknameInput.value)) {
            nicknameErrorMessage.style.color = "red";
            nicknameErrorMessage.innerText = "닉네임은 2 ~ 16글자의 영문, 한글, 숫자로 이루어져야 합니다.";
        } else {
            nicknameErrorMessage.style.color = "green";
            nicknameErrorMessage.innerText = "사용가능한 닉네임입니다.";
        }
    } else {
        nicknameErrorMessage.style.color = "red";
        nicknameErrorMessage.innerText = "닉네임 확인 중 오류가 발생했습니다.";
    }
}

// 아이디 체크
function signinIdCheck() {
    const userIdInput = document.getElementById("user_Id");
    const userIdCheckButton = document.getElementById("idcheckButton");
    const userIdCheckResult = document.getElementById("checkResultIdTr");
    const userIdErrorMessage = document.getElementById("userIdErrorMessage");

    if (userIdInput && userIdCheckButton && userIdCheckResult && userIdErrorMessage) {
        userIdCheckButton.addEventListener('click', function() {
            const str = userIdInput.value.trim();
            if (str.length >= 1) {
                idCheck({"checkId" : str}, (result) => callbackIdCheck(result, userIdCheckResult, userIdInput, userIdErrorMessage));
            } else {
                userIdCheckResult.style.display = "table-row";
                userIdErrorMessage.style.color = "red";
                userIdErrorMessage.innerText = "아이디는 5글자 이상이어야 합니다.";
            }
        });
    } else {
        console.log("아이디 체크 요소 중 하나가 누락되었습니다.");
    }
}

// 아이디 체크 콜백
function callbackIdCheck(result, userIdCheckResult, userIdInput, userIdErrorMessage) {
    userIdCheckResult.style.display = "table-row";
    if (result === "NNNNN") {
        userIdErrorMessage.style.color = "red";
        userIdErrorMessage.innerText = "이미 사용중인 아이디입니다.";
        userIdInput.value = "";
    } else {
        const idLength = userIdInput.value.length;
        if (idLength < 6 || idLength > 20) {
            userIdErrorMessage.style.color = "red";
            userIdErrorMessage.innerText = "아이디는 6 ~ 20글자의 영문+숫자로 이루어져야 합니다.";
        } else {
            var regex = /^[a-zA-Z0-9]{6,20}$/;
            if (!regex.test(userIdInput.value)) {
                userIdErrorMessage.style.color = "red";
                userIdErrorMessage.innerText = "아이디는 6 ~ 20글자의 영문+숫자로 이루어져야 합니다.";
            } else {
                userIdErrorMessage.style.color = "green";
                userIdErrorMessage.innerText = "사용가능한 아이디입니다.";
            }
        }
    }
}

// 비밀번호 유효성 검사
function validatePassword() {
    var password1 = document.getElementById("password1").value;
    var password2 = document.getElementById("password2").value;
    var passwordMessageTr = document.getElementById("passwordMessageTr");
    var passwordErrorMessage = document.getElementById("passwordErrorMessage");

    if (password1 === "" && password2 === "") {
        passwordMessageTr.style.display = "none";
        passwordErrorMessage.innerHTML = "";
        return;
    }

    passwordMessageTr.style.display = "table-row";

    if (password1 !== password2) {
        passwordErrorMessage.style.color = "red";
        passwordErrorMessage.innerHTML = "비밀번호가 다릅니다.";
    } else {
        var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*]).{8,}$/;
        if (!regex.test(password1)) {
            passwordErrorMessage.style.color = "red";
            passwordErrorMessage.innerHTML = "영문, 숫자, 특수문자를 넣어주세요";
        } else {
            passwordErrorMessage.style.color = "green";
            passwordErrorMessage.innerHTML = "비밀번호가 일치합니다.";
        }
    }
}

// 비밀번호 클릭시 보이도록 (마우스가 눌린 상태에서만)
function togglePasswordVisibility(inputField, isMouseDown) {
    if (isMouseDown && inputField.type === "password") {
        inputField.type = "text";
    } else {
        inputField.type = "password";
    }
}

// 비밀번호 확인
function signinPwdCheck(){
    let isMouseDown = false;
    const pwdImgElement = document.getElementById("pwdImg");
    const inputField = document.getElementById("password1");

    pwdImgElement.addEventListener("mousedown", function() {
        isMouseDown = true;
        togglePasswordVisibility(inputField, isMouseDown);
    });

    pwdImgElement.addEventListener("mouseup", function() {
        isMouseDown = false;
        togglePasswordVisibility(inputField, isMouseDown);
    });
}

// 생년월일 다음날 설정 불가
function DateInput(){
    const birthDateInput = document.getElementById('birthDate');
    const today = new Date();

    const todayStr = today.toISOString().split('T')[0];
    birthDateInput.setAttribute('max', todayStr);
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
        const newValue = value.replace(/[^0-9]/g, '');
        if (newValue !== value) {
            event.target.value = newValue;
            verificationPhoneTr.style.display = "table-row";
            PverificationMessage.style.color = "red";
            PverificationMessage.innerText = "숫자만 입력 가능합니다.";
        } else {
            PverificationMessage.innerText = "";
        }
    }

    suffix1Element.addEventListener('input', updatePhoneNumber);
    suffix1Element.addEventListener('input', allowOnlyNumbers);
    suffix2Element.addEventListener('input', updatePhoneNumber);
    suffix2Element.addEventListener('input', allowOnlyNumbers);
}

let authNo;
let isPhoneClickInProgress = false; // 전화 인증 진행 상태 변수

// 폰 인증
function phoneClick() {
    if (isPhoneClickInProgress) return;
    isPhoneClickInProgress = true;

    const phoneInputValue = document.getElementById("input-value-phone").value;
    var verificationPhoneTr = document.getElementById("verificationPhoneTr");
    var PverificationMessage = document.getElementById("Pverification-message");
    const stopBtn = document.getElementById("check_PhoneSecretBtn");

    authNo = Math.floor(Math.random() * 1000000).toString().padStart(6, '0');
    //$('#phoneCheck').prop('checked', false);
    document.getElementById('phoneCheck').checked = false;
    verificationPhoneTr.style.display = "table-row";

    insertPhoneCheck({ checkPhone: phoneInputValue }, function(res) {
        if (res.trim() === "onPhone") {
            verificationPhoneTr.style.display = "table-row";
            PverificationMessage.style.color = "red";
            PverificationMessage.innerHTML = "해당 번호는 등록된 번호입니다. 다시 입력하세요.";
            isPhoneClickInProgress = false;
        } else if (res.trim() === "NoPhone") {
            sendPhoneAuthNoAjax({ authNo: authNo, phoneInput: phoneInputValue }, function(res) {
                if (res.trim() === "NNNNY") {
                    verificationPhoneTr.style.display = "table-row";
                    PverificationMessage.style.color = "green";
                    stopBtn.disabled = false;
                    PverificationMessage.innerHTML = "인증번호가 전송되었습니다.";
                    console.log('인증번호 : ' + authNo);
                    console.log('전송한 휴대폰번호 : ' + phoneInputValue);

                    startPTimer();
                    //$("#check_PhoneSecretBtn").prop('disabled', false);
                    document.getElementById('check_PhoneSecretBtn').disabled = false;
                } else {
                    verificationPhoneTr.style.display = "table-row";
                    PverificationMessage.style.color = "red";
                    PverificationMessage.innerHTML = "전송에 실패했습니다. 핸드폰 번호를 다시 한번 확인해주세요.";
                }
                isPhoneClickInProgress = false;
            });
        } else {
            verificationPhoneTr.style.display = "table-row";
            PverificationMessage.style.color = "red";
            PverificationMessage.innerHTML = "전송에 실패했습니다. 핸드폰 번호를 다시 한번 확인해주세요.";
            isPhoneClickInProgress = false;
        }
    });
}

// 폰 인증 확인
function checkAuthNum() {
    const inputCode = document.getElementById("Pverification-code").value;
    var checkResultPhoneTr = document.getElementById("checkResultPhoneTr");
    var userPhoneErrorMessage = document.getElementById("userPhoneErrorMessage");
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
        clearInterval(ptimer);
    }
}

// "인증번호 전송" 버튼 클릭 이벤트 핸들러 등록
function phoneCheckButton() {
    const phoneCheckButton = document.getElementById("phoneCheckButton");
    if (phoneCheckButton) {
        phoneCheckButton.addEventListener("click", function() {
            phoneClick();
            //$("#check_PhoneSecretBtn").prop('disabled', false);
            document.getElementById('check_PhoneSecretBtn').disabled = false;
        });
    }
}

// "인증확인" 버튼 클릭 이벤트 핸들러 등록
function checkPhoneSecretBtn(){
    const checkPhoneSecretBtn = document.getElementById("check_PhoneSecretBtn");
    if (checkPhoneSecretBtn) {
        checkPhoneSecretBtn.addEventListener("click", function() {
            checkAuthNum();
        });
    }
}

// 이메일 아이디적는칸에 영어와 숫자만 가능하게
function addEmailValidation() {
    const emailPrefixElement = document.getElementById("email-prefix");
    const verificationEmailTr = document.getElementById("verificationEmailTr");
    const verificationMessage = document.getElementById("verification-message");

    emailPrefixElement.addEventListener('input', function(event) {
        const value = event.target.value;
        const validValue = value.replace(/[^a-zA-Z0-9]/g, '');
        if (value !== validValue) {
            event.target.value = validValue;
            verificationEmailTr.style.display = "table-row";
            verificationMessage.style.color = "red";
            verificationMessage.innerText = "영어 / 숫자 만 가능합니다.";
        } else {
            verificationMessage.innerText = "";
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
        const validValue = value.replace(/[^a-zA-Z.]/g, '');
        if (value !== validValue) {
            event.target.value = validValue;
            verificationEmailTr.style.display = "table-row";
            verificationMessage.style.color = "red";
            verificationMessage.innerText = "한글 / 숫자는 입력이 불가능합니다.";
        } else {
            verificationMessage.innerText = "";
        }
    });
}

// 이메일 인증 코드 전송 함수
function sendVerificationCode() {
    const emailInput = document.getElementById("input-value-email").value;

    if (emailInput.trim().length > 0) {
        sendEmailVerificationRequest(emailInput);
        startTimer();
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
    } else if (response === "emailCheck Duplicated") {
        verificationMessage.style.color = "red";
        verificationMessage.innerText = "해당 이메일은 이미 등록된 이메일입니다. 다시 입력해주세요!";
    }
}

// UUID 이메일 체크 콜백
function callbackEmailSecret(result, emailSecretCheckResult, check_emailSecretBtn) {
    const userEmailErrorMessage = document.getElementById("userEmailErrorMessage");
    const insertMemberBtn = document.getElementById("submitButton");
    const stopEmailBtn = document.getElementById("check_emailSecretBtn");
    emailSecretCheckResult.style.display = "table-row";

    if (result === "emailSecretCodeCheck No") {
        userEmailErrorMessage.style.color = "red";
        userEmailErrorMessage.innerText = "인증 코드가 일치하지 않습니다.";
    } else if (result === "emailSecretCodeCheck Yes") {
        userEmailErrorMessage.style.color = "green";
        userEmailErrorMessage.innerText = "인증이 확인되었습니다.";
        clearInterval(timer);
        insertMemberBtn.disabled = false;
        stopEmailBtn.disabled = true;
    } else {
        userEmailErrorMessage.style.color = "red";
        userEmailErrorMessage.innerText = "인증을 확인할 수 없습니다.";
    }
}

// 이메일 UUID 인증 코드 확인
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
    emailCheckButton.addEventListener('click', function(ev) {
        ev.preventDefault();
        const emailInput = document.getElementById("input-value-email").value;
        sendEmailVerificationRequest(emailInput);
        alert("인증번호가 전송되었습니다 잠시만 기다려주세요.");
    });
}

let timer;
let ptimer;

// 핸드폰 타이머 시작 함수
function startPTimer() {
    clearInterval(ptimer);

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

            var checkResultPhoneTr = document.getElementById("checkResultPhoneTr");
            var userPhoneErrorMessage = document.getElementById("userPhoneErrorMessage");
            checkResultPhoneTr.style.display = "table-row";
            userPhoneErrorMessage.style.color = "red";
            userPhoneErrorMessage.innerHTML = "인증 실패 다시 한번 확인해주세요.";

            //$("#check_PhoneSecretBtn").prop('disabled', true);
            document.getElementById('check_PhoneSecretBtn').disabled = true;
            
        }
    }, 1000);
}

// 이메일 타이머 시작 함수
function startTimer() {
    clearInterval(timer);

    var duration = 3 * 60;
    var timerDisplay = document.getElementById('timer');

    timer = setInterval(function () {
        var minutes = parseInt(duration / 60, 10);
        var seconds = parseInt(duration % 60, 10);

        timerDisplay.textContent = minutes + ":" + (seconds < 10 ? "0" + seconds : seconds);
        duration--;

        if (duration < 0) {
            clearInterval(timer);
            timerDisplay.textContent = "시간 초과";
        }
    }, 1000);
}

// 이메일 입력
function sgininemail() {
    const prefixElement = document.getElementById("email-prefix");
    const suffixElement = document.getElementById("email-suffix");
    const domainList = document.getElementById("email-domain-list");
    const inputValueElement = document.getElementById("input-value-email");

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
        updateEmail();
    }

    function init() {
        handleDomainListChange();
        prefixElement.addEventListener('input', updateEmail);
        suffixElement.addEventListener('input', updateEmail);
        domainList.addEventListener('change', handleDomainListChange);
    }

    init();
}

// 주소 불러오기 - kakao 우편번호 서비스 api (https://postcode.map.daum.net/guide)
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = '';
            var extraAddr = '';

            if (data.userSelectedType === 'R') {
                addr = data.roadAddress;
            } else {
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }

                document.getElementById("sample6_address").value = addr + extraAddr;
            } else {
                document.getElementById("sample6_address").value = addr;
            }

            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

// 주소 확인
function updateAddressDisplay() {
    const addressInput = document.getElementsByClassName("addressInput")[0];
    const detailAddressInput = document.getElementsByClassName("detailAddressInput")[0];
    const sample6_postcode = document.getElementById("sample6_postcode");
    const addressDisplay = document.getElementById("input-value-address");

    if (addressInput && detailAddressInput && addressDisplay) {
        const addressValue = addressInput.value;
        const detailAddressValue = detailAddressInput.value;
        const sample6Value = sample6_postcode.value;

        const fullAddress = "[" + sample6Value + "] " + addressValue + " " + detailAddressValue;
        addressDisplay.value = fullAddress;
    }
}

function checkAddress() {
    updateAddressDisplay();
}

// 이전페이지로 돌아가기
function backPage(){
    var backButton = document.getElementById('backButton');
    backButton.addEventListener('click', function() {
        window.history.back();
    });
}

// 3개 이상 선택 불가 및 값 출력
function sginingenreLike(){
    const genreLikeInput = document.querySelector("input[name='genreLike']");
    const buttons = document.querySelectorAll('.btn-staez3');

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            if (button.classList.contains('selected')) {
                button.classList.remove('selected');
            } else {
                const selectedButtons = document.querySelectorAll('.btn-staez3.selected');
                if (selectedButtons.length < 3) {
                    button.classList.add('selected');
                } else {
                    alert("최대 갯수입니다.");
                }
            }
            updateInput();
        });
    });

    function updateInput() {
        const selectedButtons = document.querySelectorAll('.btn-staez3.selected');
        const selectedGenres = Array.from(selectedButtons).map(button => button.getAttribute('data-genre'));
        genreLikeInput.value = selectedGenres.join(' ');
    }
}

// 모든 정보가 저장되어야 다음 버튼 활성화
function signinSubmitButton(){
    const submitButton = document.getElementById('submitButton');
    const form = document.getElementById('enrollForm');

    submitButton.addEventListener('click', function(event) {
        event.preventDefault();
        const isValid = validateForm();
        if (isValid) {
            form.submit();
        } else {
            alert("입력값이 올바르지 않습니다. 모든 필수 입력란을 작성해주세요.");
        }
    });

    function validateForm() {   
        var nicknameCheckResult = document.getElementById("checkResultNick");
        var userIdCheckResult = document.getElementById("checkResultId");
        var passwordMessage = document.getElementById("passwordMessage");
        var emailSecretCheckResult = document.getElementById("userEmailErrorMessage");

        if (nicknameCheckResult.innerText !== "사용가능한 닉네임입니다." ||
            userIdCheckResult.innerText !== "사용가능한 아이디입니다." ||
            passwordMessage.innerText !== "비밀번호가 일치합니다." ||
            emailSecretCheckResult.innerText !== "인증이 확인되었습니다.") {
            return false;
        }
        return true;
    }
}

// 버튼 클릭시 색상 변경
function checkButton(){
    var buttons = document.querySelectorAll(".check_button");

    buttons.forEach(function(button) {
        button.addEventListener("mousedown", function() {
            button.classList.add("clicked");
        });

        button.addEventListener("mouseup", function() {
            button.classList.remove("clicked");
        });
    });
}