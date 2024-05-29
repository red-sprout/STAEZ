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
            console.log(response);
            handleEmailCheckResponse(response);
        },
        error: function() {
            console.log("이메일 인증 코드 전송 실패");
        }
    });
}

//암호키 체크
function emailCheckCode(data, callback) {
    $.ajax({
        url: "emailSecretCodeCheck.me",
        data: data,
        success: function(result) {
            //console.log("AJAX success result: ", result); // 결과를 로그에 출력하여 확인
            callback(result);
        },
        error: function() {
            console.log("이메일 UUID 체크 ajax 실패");
        }
    });
}