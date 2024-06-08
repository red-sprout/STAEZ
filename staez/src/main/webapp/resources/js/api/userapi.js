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
            //console.log(response);
            handleEmailCheckResponse(response);
        },
        error: function() {
                    //인증하기 버튼 비활성화
        emailBtnNo();
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
            // console.log("Server response:", result); // 서버 응답 확인
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("이메일 UUID 체크 ajax 실패");
            console.log("Status: " + textStatus);
            console.log("Error: " + errorThrown);
            console.log("Response Text: " + jqXHR.responseText);
        }
    });
}

// 이메일로 아이디찾기
function getIdbyEmail(data, callback) {
    $.ajax({
        url: "findEmailCheck.me",
        data: data,
        success: function(result) {
            // console.log("Server response:", result); // 서버 응답 확인
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("이메일 아이디찾기 ajax 실패");
            console.log("Status: " + textStatus);
            console.log("Error: " + errorThrown);
            console.log("Response Text: " + jqXHR.responseText);
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
            console.log("Server response:", result);
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("아이디, 핸드폰, 이메일 확인 ajax 실패");
            console.log("Status:", textStatus);
            console.log("Error:", errorThrown);
            console.log("Response Text:", jqXHR.responseText);
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
            console.log("Server response:", result);
            callback(result);
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("비밀번호 변경 ajax 실패");
            console.log("Status:", textStatus);
            console.log("Error:", errorThrown);
            console.log("Response Text:", jqXHR.responseText);
        }
    });
}

// 시간 초과 시 데이터베이스로 삭제 요청을 보내는 함수
function deleteVerificationCode() {
    var verificationCode = document.getElementById('verification-code').value;

    // Ajax를 사용하여 데이터베이스로 삭제 요청 보내기
    // 예시: jQuery를 사용한 Ajax 요청
    $.ajax({
        url: "deleteEmailAuth.me",
        type: "POST",
        data: { verificationCode: verificationCode },
        success: function(response) {
            console.log("Verification code deleted successfully.");
        },
        error: function(xhr, status, error) {
            console.error("Error deleting verification code:", error);
        }
    });
}