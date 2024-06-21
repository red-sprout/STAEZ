// 닉네임 체크
function nickCheck(data, callback) {
    $.ajax({
        url: "nickCheck.me",
        data: data,
        success: function (result) {
            callback(result);
        },
        error: function () {
            console.log("닉네임 중복체크 ajax 실패");
        }
    });
}
// 아이디체크 함수
function idCheck(data, callback) {
    $.ajax({
        url: "idCheck.me",
        data: data,
        success: function (result) {
            callback(result);
        },
        error: function () {
            console.log("아이디 중복체크 ajax 실패");
        }
    });
}

// 이메일 인증 요청을 서버로 보내는 함수
function sendEmailVerificationRequest(emailInput) {
    $.ajax({
        url: "emailCheck.me",
        data: { email: emailInput },
        success: function(response) {
            handleEmailCheckResponse(response);
        },
        error: function() {
            alert("이미 전송 처리했습니다. 번호가 틀리다면 재전송을 누른 후 다시 전송버튼을 누르세요.");
        }
    });
}

// 이메일 인증 요청을 서버로 보내는 함수
function verifyNameAndEmail(nameInput, emailInput) {
    $.ajax({
        url: "emailbyName.me",
        data: { checkEmail: emailInput, userName: nameInput },
        success: function(response) {
            handleEmailCheckResponse(response);
        },
        error: function() {
            alert("이미 전송 처리했습니다. 번호가 틀리다면 재전송을 누른 후 다시 전송버튼을 누르세요.");
        }
    });
}

// 이메일 인증 요청을 서버로 보내는 함수
function verifyNameAndEmailAndPhone(nameInput, emailInput, phoneInput) {
    $.ajax({
        url: "emailbyNamebyPhone.me",
        data: { checkEmail: emailInput, userName: nameInput, phone : phoneInput},
        success: function(response) {
            handleEmailCheckResponse(response);
        },
        error: function() {
            alert("이미 전송 처리했습니다. 번호가 틀리다면 재전송을 누른 후 다시 전송버튼을 누르세요.");
        }
    });
}

// 암호키 체크
function emailCheckCode(data, callback) {
    $.ajax({
        url: "emailSecretCodeCheck.me",
        data: data,
        success: function(result) {
            callback(result);
            console.log(result)
        },
        error: function(jqXHR, textStatus, errorThrown) {
        }
    });
}

// 이메일로 아이디찾기
function getIdbyEmail(data, callback) {
    $.ajax({
        url: "findEmailCheck.me",
        data: data,
        success: function(result) {
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
        }
    });
}

// 핸드폰으로 아이디찾기
function getIdbyPhone(data, callback) {
    $.ajax({
        url: "findPhoneCheck.me",
        data: data,
        success: function(result) {
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
        }
    });
}

// 비번 바꾸기 전 아이디 핸드폰 이메일 확인 맞는지
function clickIdPhoneEmailSelect(data, callback) {
    $.ajax({
        url: "checkFindNewPwd.me",
        type: "POST",
        data: data,
        success: function(result) {
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
        }
    });
}

// 비밀번호 변경
function clickNewPwdInsert(data, callback) {
    $.ajax({
        url: "insertNewPwd.me",
        type: "POST",
        data: data,
        success: function(result) {
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
        }
    });
}

// 핸드폰인증
function sendAuthNumAjax(data, callback){
    $.ajax({
        url: 'sendPhoneAuth.me',
        data : data,
        success: res => callback(res),
        error: () => {
            alert('인증번호 전송에 실패하였습니다');
        }
    });
}

// 아이디 찾기 핸드폰 중복 인증
function insertPhoneCheck(data, callback){
    $.ajax({
        url: 'insertPhoneCheck.me',
        data,
        success: res => callback(res),
        error: () => {
            alert('휴대폰 인증번호 전송에 실패하였습니다');
        }
    });
}

// 아이디 찾기 핸드폰 인증
function sendPhoneAuthNoAjax(data, callback){
    $.ajax({
        url: 'sendPhoneAuth.me',
        type:'POST',
        data,
        success: res => callback(res),
        error: () => {
            alert('휴대폰 인증번호 전송에 실패하였습니다');
        }
    });
}

// 아이디 찾기 이름과 전화번호를 검증하는 함수
function verifyPhoneAndName(userName, phoneInput, callback) {
    $.ajax({
        url: "findPhoneCheck.me",
        data: { checkFindPhone: phoneInput, userName: userName },
        success: function(response) {
            callback(response);
        },
        error: function() {
            alert("서버와의 통신 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
}