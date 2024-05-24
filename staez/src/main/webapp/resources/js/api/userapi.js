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